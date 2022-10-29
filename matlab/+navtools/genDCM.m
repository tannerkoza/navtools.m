function DCM = genDCM(angles, seq, units)
%  NAVTOOLS.GENDCM Convert Euler angles (roll, pitch, yaw) to a coordinate transition]
% matrix (frame rotation) for any length of rotation sequence.
%
%   Source: Principles of GNSS, Inertial, and Multisensor Integrated Navigation Systems,
%   Second Edition (Paul D. Groves)
%
%   Author: Tanner Koza
%
%   See also NAVTOOLS.DCM2EULER

    % Initialization
    lenSeq = length(seq); % number of rotations
    R = NaN([3 3 lenSeq]); % preallocation of rotation matrices
    DCM = eye(3); % for pseudo "first" multiplication

    switch lower(units)

        case 'rads'
            s = @sin;
            c = @cos;
        case 'degs'
            s = @sind;
            c = @cosd;
        otherwise
            error("'%s' is not a valid unit.\n\nPass 'rads' or 'degs'.", units)

    end

    % DCM Creation
    for i = 1:lenSeq

        switch seq(i)

            case 'x'
                R(:, :, i) = [1 0             0; ...
                              0 c(angles(i))  s(angles(i)); ...
                              0 -s(angles(i)) c(angles(i))];
            case 'y'
                R(:, :, i) = [c(angles(i))  0 -s(angles(i)); ...
                              0             1 0 ; ...
                              s(angles(i))  0 c(angles(i))];
            case 'z'
                R(:, :, i) = [c(angles(i))  s(angles(i)) 0; ...
                              -s(angles(i)) c(angles(i)) 0; ...
                              0             0            1];
            otherwise
                if class(seq(i)) ~= "char"
                    error("The sequence input should be a 'char'!")
                else
                    error("Only char array sequences of 'x', 'y', and 'z' are permitted!")
                end
        end

        DCM = R(:, :, i) * DCM; % intrinsic rotations

    end

    end