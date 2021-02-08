require("../libs/array-extensions");
require("../libs/validations");

const { sampledSinWithT } = require("../libs/signals");
const gnuplot = require("gnu-plot")();

const s1 = sampledSinWithT(1, 5, 0, 1000, 0, 1);
const s2 = sampledSinWithT(1, 5, 0, 100, 0, 1);
const s3 = sampledSinWithT(1, 5, 0, 25, 0, 1);
const s4 = sampledSinWithT(1, 5, 0, 4, 0, 1);

gnuplot.plot([
  {
    data: s1.t.pair(s1.x),
    style: "lines",
    title: "1000 Hz"
  },
  {
    data: s2.t.pair(s2.x),
    style: "lines",
    title: "100 Hz"
  },
  {
    data: s3.t.pair(s3.x),
    style: "lines",
    title: "25 Hz"
  },
  {
    data: s4.t.pair(s4.x),
    style: "lines",
    title: "4 Hz"
  }
]);

gnuplot.set({
  xrange:"[0:1]",
  yrange:"[-1:1]"
});
