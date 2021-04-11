require("../libs/array-extensions");
require("../libs/validations");

const { random } = require("mathjs");
const { sampledSinWithT } = require("../libs/signals");

const gnuplot = require("gnu-plot")();

let {t, x} = sampledSinWithT(1, 1, 0, 10, 0, 2);
const noise = t.map(() => random(-0.1, 0.1));

x = x.map((v, i) => v + noise[i]);

gnuplot
  .print("set multiplot layout 2,1\n")
  .print("set tmargin 2 \n")
  .print(`set title "Signal with noise"\n`)
  .plot([ { data: t.pair(x) } ])
  .print(`set title "Noise"\n`)
  .plot([ { data: t.pair(noise) } ])