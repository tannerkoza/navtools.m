function dcm = dcm(angles, seq, units)
%NAVTOOLS.DCM Convert Euler angles (roll, pitch, yaw) to a coordinate transition
%matrix (frame rotation) for any length of rotation sequence.
%
%   Source: Principles of GNSS, Inertial, and Multisensor Integrated Navigation Systems,
%   Second Edition (Paul D. Groves)
%
%   Author: Tanner Koza
%
%   See also NAVTOOLS.DCM2EULER

    % Initialization
    len_seq = length(seq); % number of rotations
    R = NaN([3 3 len_seq]); % preallocation of rotation matrices
    dcm = eye(3); % for pseudo "first" multiplication

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
    for i = 1:len_seq

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
                if ~ischar(seq(i))
                    error("The sequence input should be a 'char'!")
                else
                    error("Only char array sequences of 'x', 'y', and 'z' are permitted!")
                end
        end

        dcm = R(:, :, i) * dcm; % intrinsic rotations

    end

    end