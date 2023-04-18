function carrier = real_carrier(fcarrier, fsamp, duration, noise)
%IQ_CARRIER Produces an real carrier signal based on the sampling frequency,
%carrier frequency, and duration of a signal.
%
%   Inputs:
%       - fcarrier: carrier frequency [Hz]
%       - fsamp: sampling frequency [Hz]
%       - duration: length of signal [s]
%       - noise: (optional) noise standard deviation 
%
%   Outputs: 
%       - carrier: real carrier signal
%
%   Author: Tanner Koza
%
%   See also NAVTOOLS.SIGNALS.COMPLEX_CARRIER

carrier = real(navtools.iq_carrier(fcarrier,fsamp,duration));

if exist('noise','var')
    num_samps = length(carrier);
    carrier = carrier + noise*randn(1, num_samps);
end

end

