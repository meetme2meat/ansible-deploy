/* Adds methods to a Javascript Prototype Object (pseudo-Class) */
Function.prototype.method = function (name, func) {
  this.prototype[name] = func;
  return this;
};