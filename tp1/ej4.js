require("../libs/array-extensions");
require("../libs/validations");

const { sampledSinWithT } = require("../libs/signals");
const gnuplot = require("gnu-plot")();

const s1 = sampledSinWithT(1, 4000, 0, 129, 0, 2);

gnuplot.plot([
  {
    data: s1.t.pair(s1.x),
    style:"lines"
  }
]);