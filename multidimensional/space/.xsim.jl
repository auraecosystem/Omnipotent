# Super-fast vector operations on high-dimensional arrays
function simulate_multidimensional_space!(space::AbstractArray{T, N}) where {T, N}
    println("Processing a $(N)-Dimensional physical space...")
    
    # The dot (.) broadcasts the operation across every spatial index simultaneously
    # Simulates a universal decay function across all coordinate matrices
    space .= sin.(space) .* cos.(space) .^ 2
    return space
end

# Create a massive 4D physical matrix (Grid size 50x50x50 across 50 frames of time)
cosmic_grid = rand(Float64, 50, 50, 50, 50)
simulate_multidimensional_space!(cosmic_grid)
