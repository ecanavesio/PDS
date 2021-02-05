const { sign, abs, max, min, round } = require("mathjs");

/**
 * @param {Number} H amplitude quantification factor
 * @param {Array<Number>} signal signal to quantify
 * @return {Array<Number>} quantified signal
 */
function quantificationH(H, signal) {
  const A = max(max(signal), abs(min(signal)));
  return quantification(H, A, signal);
}

/**
 * @param {Number} H quantification factor
 * @param {Number} A signal amplitude
 * @param {Array<Number>} signal signal to quantify
 * @return {Array<Number>} quantified signal
 */
function quantification(H, A, signal) {
  return signal.map(x => sign(x) * round(abs(x)/A*H)*A/H)
}

module.exports = {
  quantification
}