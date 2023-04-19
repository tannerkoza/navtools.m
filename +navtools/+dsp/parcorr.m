function [correlation, sample_lag] = parcorr(baseband_sig, replica)
%PARCORR Correlates two sequences in paralell using an FTT 
%   This is specifically used for GNSS correlation applications.
%
%   Inputs:
%       - baseband_sig: sequence corresponding to baseband samples in GNSS
%       or any arbitrary sequence
%       - replica: sequence corresponding to replica samples or any
%       arbitrary sequence
%
%   Outputs: 
%       - correlation: correlation output across all samples
%       - sample_lag: sample index
%
%   Author: Tanner Koza

% Zero-Pad Replica
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

% Correlate
correlation_fft = baseband_fft .* conj(replica_fft);
correlation = abs(ifft(correlation_fft)).^2;
    
[~, correlation_idx] = max(correlation);
sample_lag = correlation_idx - 1;

end

