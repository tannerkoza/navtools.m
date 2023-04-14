function repvec = repvec_mult(vec, mult)
%REPVEC_MULT Repeats a vector by a specified integer or fractional
%multiplier
%
%   Inputs:
%       - vec: vector to repeat
%       - mult: multiple of initial vector to repeat
%
%   Outputs: 
%       - repvec: repeated vector
%
%   Author: Tanner Koza

repvec = [repmat(vec,1,fix(mult)) vec(1:round(numel(vec)*mod(mult,1)))];

end

