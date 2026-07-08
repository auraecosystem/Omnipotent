% Create an unconstrained 4D hyperspace
OmniSpace = rand(10, 10, 10, 10);

% The omnipotent colon (:) bypasses rows, columns, and pages,
% converting the entire multidimensional space into a single event horizon.
OmniSpace(:) = OmniSpace(:) + 100;
