function [correlation, sample_lag] = parcorr(baseband_sig, replica, is_sign_returned)
%PARCORR Correlates two sequences in parallel using an FFT 
%   This is specifically used for GNSS correlation applications.
%
%   Inputs:
%       - baseband_sig: sequence corresponding to baseband samples in GNSS
%       or any arbitrary sequence
%       - replica: sequence corresponding to replica samples or any
%       arbitrary sequence
%       - is_sign_returned: boolean that returns the
%       correlation output with the correct sign of the max value
%
%   Outputs: 
%       - correlation: correlation output across all samples
%       - sample_lag: sample index
%
%   Author: Tanner Koza

% zero-pad replica
len_baseband = numel(baseband_sig);
len_replica = numel(replica);
pad_size = len_baseband - len_replica;

if iscolumn(replica)
    replica = [replica; zeros(pad_size,1)];
else
    replica = [replica zeros(1,pad_size)];
end

% FFT
baseband_fft = fft(baseband_sig);
replica_fft = fft(replica);

% correlate
correlation_fft = baseband_fft .* conj(replica_fft);
ifft_correlation = ifft(correlation_fft);
correlation = abs(ifft_correlation).^2;
    
[~, correlation_idx] = max(correlation);
sample_lag = correlation_idx - 1;

if exist('is_sign_returned', 'var') && is_sign_returned
    correlation = sign(ifft_correlation(correlation_idx)) * correlation;
end

end

