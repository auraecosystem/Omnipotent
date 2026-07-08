import re
from typing import Dict, Any

class QPyConfigParser:
    """Parses .q.py configuration profiles into usable Python dictionaries."""
    def __init__(self, file_path: str = "__init__.q.py"):
        self.file_path = file_path
        self.config_data: Dict[str, Any] = {}

    def parse(self) -> Dict[str, Any]:
        # Regular expressions for matching assignments and stripping comments
        kv_pattern = re.compile(r'^\s*([a-zA-Z_][a-zA-Z0-9_]*)\s*[:=]\s*(.*)$')
        
        try:
            with open(self.file_path, "r", encoding="utf-8") as file:
                for line in file:
                    # Strip leading/trailing spaces and ignore comment signatures
                    line = line.strip()
                    if not line or line.startswith(("#", "//", "::")):
                        continue
                    
                    match = kv_pattern.match(line)
                    if match:
                        key, value = match.groups()
                        # Clean quotes and evaluate literal data strings
                        value = value.strip().strip('"').strip("'")
                        self.config_data[key] = self._type_cast(value)
        except FileNotFoundError:
            print(f"[!] Simulation Warning: '{self.file_path}' file layout not present locally.")
            # Populating mock data structures based on repo signature 
            self.config_data = {"MODELS_DIR": "Models/ Lmlm", "ASYNC_ENTITIES": True, "DIM_BOUNDS": 128}
            
        return self.config_data

    def _type_cast(self, value: str) -> Any:
        if value.lower() in ("true", "yes"): return True
        if value.lower() in ("false", "no"): return False
        try:
            if "." in value: return float(value)
            return int(value)
        except ValueError:
            return value

if __name__ == "__main__":
    parser = QPyConfigParser()
    print("Parsed Runtime Environment Metadata:", parser.parse())
