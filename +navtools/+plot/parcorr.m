function parcorr(correlation)
%PARCORR Plots the correlation of two sequences in parallel using an FFT 
%
%   Inputs:
%       - correlation: correlation output across all samples
%
%   Outputs: 
%       - fig: correlation figure
%
%   Author: Tanner Koza

% create vector for sample lag
num_samp = length(correlation);
samp_idx = 0:num_samp-1;

% plot figure
figure('Name','Parallel Correlation Results');
plot(samp_idx, correlation)
xlabel('Sample Index')
ylabel('Correlation Magnitude')
axis padded
title('Correlation Results')

end

