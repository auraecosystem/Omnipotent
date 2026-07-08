import os
import pathlib

def inspect_models_directory(target_path="Models/ Lmlm"):
    base_dir = pathlib.Path(target_path)
    if not base_dir.exists():
        print(f"[!] Target directory '{target_path}' not found.")
        return

    print(f"=== Structural Analysis of: {target_path} ===")
    for root, dirs, files in os.walk(base_dir):
        level = root.replace(str(base_dir), '').count(os.sep)
        indent = ' ' * 4 * (level)
        print(f"{indent}[📁] {os.path.basename(root)}/")
        
        sub_indent = ' ' * 4 * (level + 1)
        for f in files:
            file_ext = pathlib.Path(f).suffix
            print(f"{sub_indent}[📄] {f} (Type: {file_ext if file_ext else 'No Extension'})")

if __name__ == "__main__":
    # Scans the target folder layout to map the model distribution
    inspect_models_directory()
