exports._eqWrapProp = function(left){ return function(right){ return left === right }};
exports._ordWrapProp = function(left){ return function(right){ return (left === right) ? 0 : (left > right) ? 1 : -1 }};