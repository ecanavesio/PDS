Object.defineProperty(Array.prototype, "pair", {
  value: function() {
    const hasDistintLength = function(arr){
      return this.length !== arr.length
    }
    if (Array.prototype.some.call(arguments, hasDistintLength, this)) throw new Error("arr has to have the same length");
    let newArr = [];
    this.forEach((v,i) => {
      newArr.push([v].concat(Array.prototype.map.call(arguments, (arr)=>arr[i])));
    });
    return newArr;
  }
});

Object.defineProperty(Array.prototype, "reshape", {
  value: function() {
  }
});