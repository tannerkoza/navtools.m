function carrier = iq_carrier(fcarrier,fsamp,duration)
%IQ_CARRIER Produces an IQ carrier signal based on the sampling frequency,
%carrier frequency, and duration of a signal.
%
%   Inputs:
%       - fcarrier: carrier frequency [Hz]
%       - fsamp: sampling frequency [Hz]
%       - duration: length of signal [s]
%
%   Outputs: 
%       - IQ carrier signal
%
%   Author: Tanner Koza
%
%   See also NAVTOOLS.REAL_CARRIER

t = 0:(1/fsamp):(duration-1/fsamp);
carrier = exp(1i*2*pi*fcarrier*t);

end

