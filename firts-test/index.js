const gnuplot = require('gnu-plot');
const plotObj = gnuplot();

plotObj.plot([{
	data:[[0,0],[1,1],[2,0]]
}])