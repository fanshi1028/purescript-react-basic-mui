exports._eqDirectionProp = function(left){ return function(right){ return left === right }};
exports._ordDirectionProp = function(left){ return function(right){ return (left === right) ? 0 : (left > right) ? 1 : -1 }};