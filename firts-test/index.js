const gnuplot = require('gnu-plot');
const plot = gnuplot();

plot([{
	data:[[0,0],[1,1],[2,0]]
}]);