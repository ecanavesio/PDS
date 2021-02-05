const isString = (x) => Object.prototype.toString.call(x) === '[object String]';
const isDefined = (x) => !Object.is(x, null) && !Object.is(x, undefined);
module.exports = {
  isString,
  isDefined
};