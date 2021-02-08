const { sin, pi, multiply, add, divide, ceil, round, asin } = require("mathjs");

/**
 * @param {Number} A Signal amplitude
 * @param {Number} fs Signal frequency
 * @param {Number} phi Signal phase
 * @param {Number} fm Sampling frequency
 * @param {Number} t0 Initial time
 * @param {Number} tf Final time
 * @returns {Array<Number>}
 */
function sampledSin(A, fs, phi, fm, t0, tf) {
  const dt = 1/fm;
  let N = (tf - t0) * fm;
  N = N < 1 ? 1 : N;
  const dts = add(multiply(Array.from(Array(N).keys()), dt), t0);
  const base = 2 * pi * fs;

  // A * sin( 2*pi*fs * (t0 + n*dt) + phi);
  return multiply(sin(add(multiply(dts, base),phi)), A);
}

/**
 * @param {Number} A Signal amplitude
 * @param {Number} fs Signal frequency
 * @param {Number} phi Signal phase
 * @param {Number} fm Sampling frequency
 * @param {Number} t0 Initial time
 * @param {Number} tf Final time
 * @returns {Array<Number>}
 */
function sampledSinWithT(A, fs, phi, fm, t0, tf) {
  const dt = 1/fm;
  let N = (tf - t0) * fm;
  N = N < 1 ? 1 : N;
  const dts = add(multiply(Array.from(Array(N).keys()), dt), t0);
  const base = 2 * pi * fs;

  // A * sin( 2*pi*fs * (t0 + n*dt) + phi);
  return {
    t: dts,
    x: multiply(sin(add(multiply(dts, base),phi)), A)
  };
}

/**
 * @param {Number} A
 * @param {Number} fs
 * @param {Number} phi
 * @param {Number} fm
 * @param {Number} t0ceil
 * @param {Number} tf
 * @returns {Array<Number>}
 */
function sampledSyncExt(A, fs, phi, fm, t0, tf) {
  const dt = 1/fm;
  let N = (tf - t0) * fm;
  N = N < 1 ? 1 : N;
  const dts = add(multiply(Array.from(Array(N).keys()), dt), t0);
  const base = 2 * pi * fs;

  // A * sin( 2*pi*fs * (t0 + n*dt) + phi);
  const x1 = divide(multiply(sin(add(multiply(dts, base),phi)), A), 2*pi);
  return x1.pair(dts).map(([x, t]) => t===0 ? A*(base + phi)/(2*pi) : x/t);
}

/**
 * @param {Number} fs
 * @param {Number} t0
 * @param {Number} tf
 * @returns {Array<Number>}
 */
function sampledSync(fm, t0, tf) {
  const dt = 1/fm;
  const N = ceil((tf - t0) * fm);
  const dts = add(multiply(Array.from(Array(N).keys()), dt), t0);

  return dts.map(t => t===0 ? 1 : sin(t)/t);
}

/**
 * @param {Number} A
 * @param {Number} fs
 * @param {Number} phi
 * @param {Number} fm
 * @param {Number} t0ceil
 * @param {Number} tf
 * @returns {Array<Number>}
 */
function squareWave(A, fs, phi, fm, t0, tf) {
  const dt = 1/fm;
  let N = (tf - t0) * fm;
  N = N < 1 ? 1 : N;
  const dts = add(multiply(Array.from(Array(N).keys()), dt), t0);
  const base = 2 * pi * fs;

  // A * sin( 2*pi*fs * (t0 + n*dt) + phi);
  return multiply((sin(add(multiply(dts, base),phi))).map(x => x > 0 ? 1 : -1), A);
}

/**
 * @param {Number} A
 * @param {Number} fs
 * @param {Number} phi
 * @param {Number} fm
 * @param {Number} t0ceil
 * @param {Number} tf
 * @returns {Array<Number>}
 */
function triangleWave(A, fs, phi, fm, t0, tf) {
  const dt = 1/fm;
  let N = (tf - t0) * fm;
  N = N < 1 ? 1 : N;
  const dts = add(multiply(Array.from(Array(N).keys()), dt), t0);
  const base = 2 * pi * fs;

  // A * sin( 2*pi*fs * (t0 + n*dt) + phi);
  return multiply((asin(sin(add(multiply(dts, base),phi)))), 2*A/pi);
}

function sawtoothWave(A, fs, phi, fm, t0, tf) {
  const dt = 1/fm;
  let N = (tf - t0) * fm;
  N = N < 1 ? 1 : N;
  const dts = add(multiply(Array.from(Array(N).keys()), dt), t0);
  const base = 2 * pi * fs;

  // A * sin( 2*pi*fs * (t0 + n*dt) + phi);
  return multiply((asin(sin(add(multiply(dts, base),phi)))), 2*A/pi);
}

module.exports = {
  sampledSin,
  sampledSinWithT,
  sampledSync,
  sampledSyncExt,
  squareWave,
  triangleWave
};