# Function accepting a space of completely arbitrary dimensions (N)
function omnipotent_shift!(space::AbstractArray{T, N}) where {T, N}
    # The dot (.) broadcasts the operation across all N-dimensions instantly
    space .= space .^ 2
    return space
end

# Create a 6-Dimensional universe grid
OmniSpace = ones(3, 3, 3, 3, 3, 3)

# Transform the entire multidimensional space
Omniverse = omnipotent_shift!(OmniSpace)
