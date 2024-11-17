#!/usr/bin/python3
"""
 A script that finds a string in the heap of a running process, and replaces it.
"""
import sys
import os
import re


def usage_error():
    """
    Print usage error message and exit with status code 1.
    """
    print("Usage: read_write_heap.py pid search_string replace_string")
    sys.exit(1)


def main():
    """
    Main function to search and replace a string in the heap of a process.
    """
    if len(sys.argv) != 4:
        usage_error()

    try:
        pid = int(sys.argv[1])
    except ValueError:
        usage_error()

    search_string = sys.argv[2].encode('ascii')
    replace_string = sys.argv[3].encode('ascii')

    if len(replace_string) > len(search_string):
        print("Error: replace_string must not be longer than search_string")
        sys.exit(1)

    # Paths to process memory and maps
    mem_path = f"/proc/{pid}/mem"
    maps_path = f"/proc/{pid}/maps"

    try:
        # Read the memory map of the process
        with open(maps_path, 'r') as maps_file:
            heap_ranges = [
                line for line in maps_file if "[heap]" in line
            ]

        if not heap_ranges:
            print("Error: No heap found in the process")
            sys.exit(1)

        # Parse the heap range (assuming one heap region)
        heap_range = heap_ranges[0]
        match = re.match(r"([0-9a-f]+)-([0-9a-f]+)", heap_range)
        if not match:
            print("Error: Unable to parse heap range")
            sys.exit(1)

        heap_start = int(match.group(1), 16)
        heap_end = int(match.group(2), 16)

        print(f"Heap range: {hex(heap_start)}-{hex(heap_end)}")

        # Open memory for reading and writing
        with open(mem_path, 'r+b') as mem_file:
            mem_file.seek(heap_start)
            heap_data = mem_file.read(heap_end - heap_start)

            # Search for the string
            offset = heap_data.find(search_string)
            if offset == -1:
                print("Error: search_string not found in the heap")
                sys.exit(1)

            print(f"Found '{search_string.decode()}' at offset {offset} in the heap")

            # Replace the string
            mem_file.seek(heap_start + offset)
            mem_file.write(replace_string + b'\x00' * (len(search_string) - len(replace_string)))
            print(f"Replaced with '{replace_string.decode()}'")

    except PermissionError:
        print("Error: Permission denied. Try running the script as root.")
        sys.exit(1)
    except FileNotFoundError:
        print(f"Error: Process with pid {pid} does not exist")
        sys.exit(1)
    except Exception as e:
        print(f"Unexpected error: {e}")
        sys.exit(1)


if __name__ == "__main__":
    main()

