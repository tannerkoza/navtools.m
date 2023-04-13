function repvec = repvec_mult(vec, mult)
%REPVEC_MULT Summary of this function goes here
%   Detailed explanation goes here

repvec = [repmat(vec,1,fix(mult)) vec(1:round(numel(vec)*mod(mult,1)))];
end

