function carrier = complex_carrier(fcarrier, fsamp, duration, noise)
%IQ_CARRIER Produces an IQ carrier signal based on the sampling frequency,
%carrier frequency, and duration of a signal.
%
%   Inputs:
%       - fcarrier: carrier frequency [Hz]
%       - fsamp: sampling frequency [Hz]
%       - duration: length of signal [s]
%       - noise: (optional) noise standard deviation 
%
%   Outputs: 
%       - carrier: IQ carrier signal
%
%   Author: Tanner Koza
%
%   See also NAVTOOLS.SIGNALS.REAL_CARRIER

t = 0:(1/fsamp):(duration-1/fsamp);
carrier = exp(1i*2*pi*fcarrier*t);

if exist('noise', 'var')
    num_samps = length(t); 
    carrier = carrier + noise*[1 1j]*randn(2,num_samps)/sqrt(2); % sqrt(2) divides noise equally amongst channels
end

end

