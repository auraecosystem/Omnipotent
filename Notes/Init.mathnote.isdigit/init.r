from typing import List

class MultidimensionalEngine:
    """Handles deep tensor operations inside 'multidimensional/ datasets'."""
    @staticmethod
    def matrix_multiply(matrix_a: List[List[float]], matrix_b: List[List[float]]) -> List[List[float]]:
        """Computes the dot product of two 2D nested vector arrays."""
        rows_a = len(matrix_a)
        cols_a = len(matrix_a[0]) if rows_a > 0 else 0
        rows_b = len(matrix_b)
        cols_b = len(matrix_b[0]) if rows_b > 0 else 0

        # Enforce linear dimensional validation invariants
        if cols_a != rows_b:
            raise ValueError(f"Matrix Dimension Mismatch: Cannot dot product {rows_a}x{cols_a} with {rows_b}x{cols_b}")

        # Initialize an empty target matrix layout
        result = [[0.0 for _ in range(cols_b)] for _ in range(rows_a)]

        # Multi-dimensional evaluation loop
        for i in range(rows_a):
            for j in range(cols_b):
                dot_product_sum = 0.0
                for k in range(cols_a):
                    dot_product_sum += matrix_a[i][k] * matrix_b[k][j]
                result[i][j] = round(dot_product_sum, 4)

        return result

if __name__ == "__main__":
    print("=== Commencing Dimensional Transformation Testing ===")
    # 2x3 Matrix dimensions footprint
    matrix_1 = [
        [1.0, 2.0, 3.0],
        [4.0, 5.0, 6.0]
    ]
    # 3x2 Matrix dimensions footprint
    matrix_2 = [
        [7.0, 8.0],
        [9.0, 10.0],
        [11.0, 12.0]
    ]

    tensor_output = MultidimensionalEngine.matrix_multiply(matrix_1, matrix_2)
    print("Calculated Multidimensional Tensor Array Product Matrix Result:")
    for row in tensor_output:
        print(f"  {row}")

