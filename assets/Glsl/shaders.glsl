// A shader that calculates a theoretical multi-dimensional cosmic field
uniform float u_time;
varying vec4 v_position; // 4D Spacetime coordinate (X, Y, Z, W)

void main() {
    // Treat the 4D space as an all-powerful vector field
    vec4 omni_vector = v_position;
    
    // Mutate all spatial variables across time simultaneously
    omni_vector.xyz = sin(omni_vector.xyz * u_time);
    omni_vector.w = length(omni_vector.xyz); // W acts as a scale factor
    
    gl_FragColor = omni_vector;
}
