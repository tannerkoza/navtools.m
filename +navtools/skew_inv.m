function v = skew_inv(S)
%NAVTOOLS.SKEW_INV Produces the 3 element vector form of a skew-symmetric matrix.
%
%   Source: Principles of GNSS, Inertial, and Multisensor Integrated Navigation Systems,
%   Second Edition (Paul D. Groves)
%
%   Author: Tanner Koza
%
%   See also NAVTOOLS.SKEW

x = S(3,2);
y = S(1,3);
z = S(2,1);

v = [x y z]';

end
