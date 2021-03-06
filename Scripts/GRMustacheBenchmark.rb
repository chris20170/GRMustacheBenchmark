class GRMustacheBenchmark
  
  def initialize(root_path)
    self.root_path = root_path
  end
  
  def tasks
    build if @tasks.nil?
    raise unless @tasks
    @tasks
  end
  
  def versions
    build if @versions.nil?
    raise unless @versions
    @versions
  end
  
  def complexities
    build if @complexities.nil?
    raise unless @complexities
    @complexities
  end
  
  def sample_for_version_complexity_task(version, complexity, task)
    build if @sample_for_version_for_complexity_for_task.nil?
    raise unless @sample_for_version_for_complexity_for_task
    @sample_for_version_for_complexity_for_task[task][complexity][version]
  end
  
  def min_sample
    build if @min_sample.nil?
    raise unless @min_sample
    @min_sample
  end
  
  #===========================================================================
  protected
  
  attr_accessor :root_path
  
  def samples_path
    File.join(root_path, 'Product', 'samples')
  end
  
  def dichotomy(min,max,&block)
    vmin = block[min]
    vmax = block[max]
    loop do
      return min if (max - min) <= Float::EPSILON
      center = (min + max)/2.0
      vcenter = block[center]
      return center if vcenter.abs <= Float::EPSILON
      if vcenter*vmin > 0
        min = center
        vmin = vcenter
      else
        max = center
        vmax = vcenter
      end
    end
  end

  def inv_erf(x)
    dichotomy(0,6) { |y| Math.erf(y) - x }
  end

  # numbers_in_confidence_interval([gaussian distributed numbers of average 0 and standard deviation 1], Math.erf(1/Math.sqrt(2))) => numbers between -1 and 1
  def numbers_in_confidence_interval(numbers, confidence_interval)
    average = numbers.inject(&:+) / numbers.count
    standard_deviation = Math.sqrt(numbers.map { |number| (number-average)*(number-average) }.inject(&:+) / numbers.count)
    threshold = inv_erf(confidence_interval) * Math.sqrt(2) * standard_deviation
    numbers.find_all { |number| (number-average).abs <= threshold }
  end

  def build
    @tasks = []
    @versions = []
    @complexities = []
    @sample_for_version_for_complexity_for_task = {}
    @min_sample = nil
    
    Dir.glob(File.join(samples_path, '**', '*')).each do |path|
      next unless File.extname(path) == '.samples'
      
      version = File.basename(path).gsub(/\.samples$/, '')
      @versions |= [version]
      
      task = File.basename(File.dirname(path))
      @tasks |= [task]
      
      complexity = File.basename(File.dirname(File.dirname(path)))
      @complexities |= [complexity]
      
      samples = File.read(path).lines.map { |sample_line| sample_line.strip.to_f }
      samples = numbers_in_confidence_interval(samples, 0.75)  # keep 75% of the population
      sample = samples.inject(&:+) / samples.count  # average
      
      @min_sample = sample if @min_sample.nil? || @min_sample > sample
      
      @sample_for_version_for_complexity_for_task[task] ||= {}
      @sample_for_version_for_complexity_for_task[task][complexity] ||= {}
      @sample_for_version_for_complexity_for_task[task][complexity][version] = sample
    end
    
    @versions = @versions.sort_by { |version| [-(version[0].ord), version.scan(/\d*/).delete_if(&:empty?).map { |n| '%03d' % (n.to_i) }.join.to_i] }
    
    @complexities = @complexities.sort_by { |complexity| complexity.to_i }
    
    @tasks = ['parse'] + (@tasks - ['parse']) if @tasks.include?('parse')
    @tasks = ['render'] + (@tasks - ['render']) if @tasks.include?('render')
    
    self
  end
end
