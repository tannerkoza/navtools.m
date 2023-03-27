function rpy = dcm2euler(dcm)
%NAVTOOLS.DCM2EULER Convert coordinate transition matrix (frame rotation) to
%Euler angles (roll, pitch, yaw).
%
%   Source: Principles of GNSS, Inertial, and Multisensor Integrated Navigation Systems,
%   Second Edition (Paul D. Groves)
%
%   Author: Tanner Koza
%   
%   See also NAVTOOLS.DCM

    phi = atan2d(dcm(2,3), dcm(3,3));
    theta = -asind(dcm(1,3));
    psi = atan2d(dcm(1,2), dcm(1,1));

    rpy = [phi, theta, psi]; % roll, pitch, yaw

end