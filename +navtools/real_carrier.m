function carrier = real_carrier(fcarrier,fsamp,duration)
%IQ_CARRIER Produces an real carrier signal based on the sampling frequency,
%carrier frequency, and duration of a signal.
%
%   Inputs:
%       - fcarrier: carrier frequency [Hz]
%       - fsamp: sampling frequency [Hz]
%       - duration: length of signal [s]
%
%   Outputs: 
%       - real carrier signal
%
%   Author: Tanner Koza
%
%   See also NAVTOOLS.IQ_CARRIER

carrier = real(navtools.iq_carrier(fcarrier,fsamp,duration));

end

