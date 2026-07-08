⍝ Define an omnipotent space of N-dimensions filled with initial states
OmniSpace ← ⍳ 5 5 5 5 5  ⍝ A 5-Dimensional hypercube

⍝ An omnipotent function that modifies all dimensions (rank infinity ⍤ ¯1)
OmniChange ← {⍵ + 1}⍤¯1

⍝ Execute change across the entire multidimensional cosmos at once
Omniverse ← OmniChange OmniSpace
