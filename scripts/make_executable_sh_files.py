#!/usr/bin/env python3

import os
import argparse
import stat

def set_executable(file_path):
    """Set the executable permission on a file."""
    os.chmod(file_path, os.stat(file_path).st_mode | stat.S_IEXEC)

def find_repo_root(start_path):
    """Find the root of the repo by looking for the .git directory."""
    path = start_path
    while path != '/' and not os.path.isdir(os.path.join(path, '.git')):
        path = os.path.dirname(path)
    return path if os.path.isdir(os.path.join(path, '.git')) else None

def main(repo_path):
    not_executable = []
    converted = []

    for root, dirs, files in os.walk(repo_path):
        for file in files:
            if file.endswith('.sh'):
                file_path = os.path.join(root, file)
                if not os.access(file_path, os.X_OK):
                    not_executable.append(file_path)
                    set_executable(file_path)
                    converted.append(file_path)

    print("Files that were not executable:")
    for file in not_executable:
        print(file)

    print("\nFiles converted to executable:")
    for file in converted:
        print(file)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Set executable permissions on .sh files in a repository.')
    parser.add_argument('-p', '--path', help='Path to the directory to check. If not provided, script attempts to find the repo root.')
    args = parser.parse_args()

    if args.path:
        repo_path = args.path
    else:
        script_dir = os.path.dirname(os.path.realpath(__file__))
        repo_path = find_repo_root(script_dir)
        if repo_path is None:
            print("Error: Repository root could not be determined.")
            exit(1)

    main(repo_path)

