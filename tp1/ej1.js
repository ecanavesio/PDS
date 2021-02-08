require("../libs/array-extensions");
require("../libs/validations");

const { sampledSin, sampledSync, squareWave, triangleWave } = require("../libs/signals");
const { quantification } = require("../libs/signals/operations");
const { pi } = require("mathjs");
const { plot } = require("gnu-plot")();
// const { chunk } = require("underscore");

// const fs = 10; //[Hz]
// const fm = 20; // [Hz]
// const phi = pi/10;
// const dt = 1/fm;
// const T = 1; // [s]
// const N = T*fm;
// const ns = Array.from(Array(N).keys());

// const x1 = ns.map(n => sin(2*pi*fs * n*dt + phi));

// log("N = ", N);

// plot([{
//   data: ns.map(n => T*n/N).pair(x1)
// }])


// const fs = 10; [Hz]
// const fm = 20; [Hz]
// const phi = pi/10; [rad]
// const t0 = 0; [s]
// const tf = 1; [s]

const x = quantification(2, 1, sampledSin(1, 10, 0, 400, 0, 1));
// const x = sampledSync(10, -20, 20);
// const x = squareWave(1, 1, 0, 20, -5, 5);
// const x = triangleWave(1, 1, 0, 20, -5, 5);


const ns = Array.from(x.keys());
plot([{
  data: ns.pair(x),
  style: "linespoints"
}])