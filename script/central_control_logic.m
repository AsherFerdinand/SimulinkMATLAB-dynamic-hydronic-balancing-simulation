function [valveStates, Taverage] = controlAllValves(TroomArray, TdesiredArray)
% controlAllValves computes valve commands and Taverage for multiple rooms.
%
% Inputs:
%   TroomArray     - Nx1 or 1xN vector of current room temperatures
%   TdesiredArray  - Nx1 or 1xN vector of desired temperatures
%
% Outputs:
%   valveStates    - Nx1 double array (1 = open, 0 = closed)
%   Taverage       - Scalar double, average temp of rooms needing heating

    % Ensure column vectors
    TroomArray = TroomArray(:);
    TdesiredArray = TdesiredArray(:);

    % Number of rooms
    nRooms = length(TroomArray);

    % Initialize valve states
    valveStates = zeros(nRooms, 1);  % Default to closed

    % Compute dynamic Taverage
    heatingNeededIdx = TroomArray+0.3< TdesiredArray;

    if any(heatingNeededIdx)
        Taverage = mean(TroomArray(heatingNeededIdx));
    else
        Taverage = NaN;  % Or fallback value
    end

    % Apply control logic
    for i = 1:nRooms
        Troom = TroomArray(i);
        Tdesired = TdesiredArray(i);

        if Troom < Tdesired
            if Troom-0.1< Taverage
                valveStates(i) = 1;  % open
            else
                valveStates(i) = 0;  % closed
            end
        else
            valveStates(i) = 0;  % closed
        end
    end
end
