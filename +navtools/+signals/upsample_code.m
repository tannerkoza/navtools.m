function [upsamp_code, new_rem_code_phase] = upsample_code(code, rem_code_phase, fsamp, fchip)
%UPSAMPLE_CODE Upsamples any code (eg. ranging, data, etc.) based on the sampling rate
% and current chipping rate of the code.
%
%   Inputs:
%       - code: code to upsample [whole]
%       - fsamp: sampling frequency [Hz]
%       - duration: length of signal [s]
%       - noise: (optional) noise standard deviation 
%
%   Outputs: 
%       - carrier: real carrier signal
%
%   Author: Tanner Koza

% initialization
        code_length = length(code);
        samp_per_chip = fsamp/fchip;
        chip_per_samp = 1/samp_per_chip;
        samp_per_code_period = ceil((code_length-rem_code_phase)/chip_per_samp);
        appended_code = [code(end) code code(1)];

        code_subchip_idx = rem_code_phase:chip_per_samp:(samp_per_code_period-1)*chip_per_samp + rem_code_phase; % [fractional chips]
        code_chip_idx = ceil(code_subchip_idx) + 1; % add 1 for one-indexing [whole chips]
        upsamp_code = appended_code(code_chip_idx);

        new_rem_code_phase = code_subchip_idx(samp_per_code_period) + chip_per_samp - code_length; % [samples]
end

