function repvec = repvec_samp(vec, total_samps)
%REPVEC_SAMP Summary of this function goes here
%   Detailed explanation goes here

vec_length = numel(vec);
mult = floor(total_samps/vec_length);
repvec = [repmat(vec,1,mult) vec(1:mod(total_samps,vec_length))];
end

