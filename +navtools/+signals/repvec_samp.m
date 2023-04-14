function repvec = repvec_samp(vec, total_samps)
%REPVEC_SAMP Repeats vector for number of specified samples
%   Total number of samples to repeat by includes the samples in the
%   vector. Therefore, total_samps < length(vec) would truncate the vector.
%
%   Inputs:
%       - vec: vector to repeat
%       - total_samps: total number of samples that comprises repeated or
%       truncated vector
%
%   Outputs: 
%       - repvec: repeated vector
%
%   Author: Tanner Koza

vec_length = numel(vec);
mult = floor(total_samps/vec_length);
repvec = [repmat(vec,1,mult) vec(1:mod(total_samps,vec_length))];

end

