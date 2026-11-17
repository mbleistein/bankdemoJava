import sys
import os
import debugpy

def main(args=None):

    debugpy.listen(("localhost", 5678))

    print("Waiting for debugger to attach...")
    debugpy.wait_for_client()  # Pauses execution until you attach the debugger
    debugpy.breakpoint()       # Forces a hard breakpoint right here
    print("Debugger attached! Running code...")
    
# --- Your regular script starts below ---

    if args is None:
        args = sys.argv[1:]

    print("=== Python Batch Report ===")
    print(f"  Script: {__file__}")
    print(f"  Mode: {'module' if args != sys.argv[1:] else 'script'}")
    print(f"  Arguments: {args}")
    print(f"  Python version: {sys.version}")
    print(f"  PYTHONPATH: {os.environ.get('PYTHONPATH', '(not set)')}")
    print(f"  ESPY_WORKING_DIR: {os.environ.get('ESPY_WORKING_DIR', '(not set)')}")
    print(f"  ESPY_OUTPUT_ENCODING: {os.environ.get('ESPY_OUTPUT_ENCODING', '(not set)')}")
    print("=== Report Complete ===")

if __name__ == "__main__":
    main()