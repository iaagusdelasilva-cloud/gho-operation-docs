import sys
import argparse
import json
import os

def main():
    parser = argparse.ArgumentParser(description="Distiller")
    parser.add_argument("--input", required=True)
    parser.add_argument("--output", required=True)
    args = parser.parse_args()

    # Simple distillation: treat each file as one passage
    with open(args.output, "a") as f_out:
        for filename in os.listdir(args.input):
            if filename.endswith(".md"):
                path = os.path.join(args.input, filename)
                with open(path, "r") as f_in:
                    content = f_in.read()
                    # Basic distillation: just take the first 100 chars as summary
                    summary = content[:100].replace("\n", " ")
                    entry = {"file": filename, "summary": summary, "full": content}
                    f_out.write(json.dumps(entry) + "\n")
    print(f"Distillation complete. Written to {args.output}")

if __name__ == "__main__":
    main()
