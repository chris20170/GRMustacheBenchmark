# GRMustache benchmarks

You can here compare the performance of [GRMustache](https://github.com/groue/GRMustache) versions.

GRMustache has been tested against random templates containing 2, 10, or 100 elements (text, `{{variable}}` tags, or `{{#section}}` tags).

Parsing and rendering tasks are measured separately.

Numbers have no unit: they are all relative to the time taken by the shortest task, which is given the score 1.

<table border="0" cellspacing="0" cellpadding="0">
<tr>
<td>
<img src="Plots/2-render.png" alt="Plot for task 'render' and complexity '2'">
</td>
<td>
<img src="Plots/2-parse.png" alt="Plot for task 'parse' and complexity '2'">
</td>
</tr>
<tr>
<td>
<img src="Plots/10-render.png" alt="Plot for task 'render' and complexity '10'">
</td>
<td>
<img src="Plots/10-parse.png" alt="Plot for task 'parse' and complexity '10'">
</td>
</tr>
<tr>
<td>
<img src="Plots/100-render.png" alt="Plot for task 'render' and complexity '100'">
</td>
<td>
<img src="Plots/100-parse.png" alt="Plot for task 'parse' and complexity '100'">
</td>
</tr>
</table>


## Rendering task

	                2       10      100
	v6.9.2    1.6e+00  4.6e+00  9.5e+00
	v6.8.4    2.3e+00  6.9e+00  1.5e+01
	v6.7.5    2.1e+00  6.6e+00  1.5e+01
	v6.6.0    2.2e+00  7.4e+00  1.6e+01
	v6.5.1    2.2e+00  7.4e+00  1.7e+01
	v6.4.1    2.2e+00  6.9e+00  1.6e+01
	v6.3.0    2.2e+00  6.9e+00  1.7e+01
	v6.2.0    2.1e+00  7.2e+00  1.7e+01
	v6.1.4    2.1e+00  6.7e+00  1.6e+01
	v6.0.1    2.3e+00  7.4e+00  1.8e+01
	v5.5.2    2.4e+00  8.1e+00  2.2e+01
	v5.4.4    1.2e+00  3.3e+00  7.8e+00
	v5.3.0    1.1e+00  3.3e+00  7.1e+00
	v5.2.0    1.1e+00  3.2e+00  6.9e+00
	v5.1.0    1.1e+00  3.2e+00  7.4e+00
	v5.0.1    1.0e+00  2.8e+00  6.3e+00
	v4.3.4    1.2e+00  3.5e+00  8.4e+00

## Parsing task

	                2       10      100
	v6.9.2    5.5e+00  1.6e+01  1.2e+02
	v6.8.4    5.6e+00  1.6e+01  1.3e+02
	v6.7.5    5.5e+00  1.6e+01  1.3e+02
	v6.6.0    4.9e+00  1.5e+01  1.2e+02
	v6.5.1    5.0e+00  1.5e+01  1.3e+02
	v6.4.1    4.7e+00  1.5e+01  1.2e+02
	v6.3.0    4.1e+00  1.4e+01  1.2e+02
	v6.2.0    3.9e+00  1.4e+01  1.2e+02
	v6.1.4    3.8e+00  1.3e+01  1.2e+02
	v6.0.1    3.6e+00  1.3e+01  1.1e+02
	v5.5.2    3.6e+00  1.3e+01  1.1e+02
	v5.4.4    3.6e+00  1.3e+01  1.1e+02
	v5.3.0    3.6e+00  1.3e+01  1.1e+02
	v5.2.0    3.6e+00  1.3e+01  1.1e+02
	v5.1.0    3.6e+00  1.3e+01  1.1e+02
	v5.0.1    3.6e+00  1.3e+01  1.2e+02
	v4.3.4    3.6e+00  1.3e+01  1.2e+02

-----

This README.md file has been generated with the `make` command.

