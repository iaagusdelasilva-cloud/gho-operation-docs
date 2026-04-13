import sys
import os

def main():
    if len(sys.argv) < 2:
        print("Uso: python3 batcher.py <inbox_dir>")
        sys.exit(1)
    
    inbox_dir = sys.argv[1]
    files = [os.path.join(inbox_dir, f) for f in os.listdir(inbox_dir) if f.endswith('.md')]
    print(f"Batched {len(files)} files.")
    for f in files:
        print(f"  - {f}")

if __name__ == "__main__":
    main()
