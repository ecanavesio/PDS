require("../libs/array-extensions");
require("../libs/validations");

const { sampledSinWithT } = require("../libs/signals");
const gnuplot = require("gnu-plot")();

const s1 = sampledSinWithT(1, 5, 0, 1000, 0, 1);
const s2 = sampledSinWithT(1, 5, 0, 100, 0, 1);
const s3 = sampledSinWithT(1, 5, 0, 25, 0, 1);
const s4 = sampledSinWithT(1, 5, 0, 4, 0, 1);

gnuplot
  .print("set multiplot layout 2,2\n")
  .print("set tmargin 2 \n")
  .print(`set title "1000 Hz"\n`)
  .plot([
    {
      data: s1.t.pair(s1.x),
      style: "lines"
    }
  ])
  .print(`set title "100 Hz"\n`)
  .plot([
    {
      data: s2.t.pair(s2.x),
      style: "lines"
    }
  ])
  .print(`set title "25 Hz"\n`)
  .plot([
    {
      data: s3.t.pair(s3.x),
      style: "lines"
    }
  ])
  .print(`set title "4 Hz"\n`)
  .plot([
    {
      data: s4.t.pair(s4.x),
      style: "lines"
    }
  ]);

gnuplot.set({
  xrange:"[0:1]",
  yrange:"[-1:1]"
});
