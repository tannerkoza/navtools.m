function S = skew(v)
%NAVTOOLS.SKEW Produces the skew-symmetric form of a 3 element vector.
%
%   Source: Principles of GNSS, Inertial, and Multisensor Integrated Navigation Systems,
%   Second Edition (Paul D. Groves)
%
%   Author: Tanner Koza
%
%   See also NAVTOOLS.SKEW_INV

x = v(1);
y = v(2);
z = v(3);

S = [ 0 -z   y;
      z  0  -x;
     -y  x   0; ];

end
