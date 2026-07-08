import sys
import os
import subprocess
import shutil

class ProjectBootstrapper:
    """Automates verification of runtimes and compilers inside 'bootstrap/'."""
    def __init__(self):
        self.python_version = sys.version_info
        self.required_commands = ["git"] # Base system binaries needed

    def verify_runtime_environment(self) -> bool:
        print("=== Step 1: Evaluating System Runtimes ===")
        print(f"[*] Native Engine Running Python: {self.python_version.major}.{self.python_version.minor}")
        
        # Guard clause against outdated Python interpreters
        if self.python_version.major < 3 or (self.python_version.major == 3 and self.python_version.minor < 8):
            print("[!] Environment Error: Python 3.8+ is strictly required.")
            return False
            
        for cmd in self.required_commands:
            if shutil.which(cmd) is None:
                print(f"[!] System Warning: Binary tool '{cmd}' was not detected in PATH.")
            else:
                print(f"[✔] System Binary Available: {cmd}")
        return True

    def install_dependencies(self) -> bool:
        print("\n=== Step 2: Syncing Local Dependency Footprints ===")
        req_file = "requirements.txt"
        
        if not os.path.exists(req_file):
            print(f"[!] Target tracker '{req_file}' missing. Creating mock dependencies blueprint...")
            with open(req_file, "w") as f:
                f.write("numpy\ncython\n")
                
        try:
            print("[*] Executing package validation protocol via pip...")
            subprocess.check_call([sys.executable, "-m", "pip", "install", "-r", req_file, "--quiet"])
            print("[✔] Application ecosystem packages synchronized successfully.")
            return True
        except Exception as e:
            print(f"[!] Package Sync Error: Dependency installation crashed. Detail: {e}")
            return False

if __name__ == "__main__":
    boot = ProjectBootstrapper()
    if boot.verify_runtime_environment():
        boot.install_dependencies()
