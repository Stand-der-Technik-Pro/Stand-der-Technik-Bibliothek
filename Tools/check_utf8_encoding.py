import os
import chardet
import sys
from pathlib import Path

def is_text_file(file_path):
    """Check if file is likely a text file based on extension"""
    text_extensions = {
        '.md', '.txt', '.csv', '.json', '.xml', '.yaml', '.yml',
        '.py', '.js', '.ts', '.html', '.css', '.scss', '.sql',
        '.sh', '.bat', '.ps1', '.cfg', '.conf', '.ini', '.toml',
        '.gitignore', '.gitattributes', '.editorconfig'
    }
    return file_path.suffix.lower() in text_extensions

def check_utf8_encoding(file_path):
    """Check if file is properly UTF-8 encoded"""
    try:
        with open(file_path, 'rb') as f:
            raw_data = f.read()

        # Skip empty files
        if not raw_data:
            return True, "Empty file"

        # Try to decode as UTF-8
        try:
            decoded = raw_data.decode('utf-8')
            return True, "Valid UTF-8"
        except UnicodeDecodeError as e:
            # Use chardet to detect encoding
            detected = chardet.detect(raw_data)
            return False, f"Not UTF-8. Detected: {detected.get('encoding', 'unknown')} (confidence: {detected.get('confidence', 0):.2f})"

    except Exception as e:
        return False, f"Error reading file: {str(e)}"

def main():
    repo_root = Path('.')
    non_utf8_files = []

    # Files to exclude from checking
    exclude_patterns = {
        '.git', 'node_modules', '__pycache__', '.pytest_cache',
        '.venv', 'venv', 'env', '.env', 'dist', 'build',
        '.coverage', '*.pyc', '*.pyo', '*.pyd', '*.so',
        '*.dll', '*.exe', '*.bin', '*.dmg', '*.pkg',
        '*.zip', '*.tar', '*.gz', '*.rar', '*.7z'
    }

    print("Checking UTF-8 encoding for all text files...")
    print("=" * 60)

    for file_path in repo_root.rglob('*'):
        # Skip directories
        if file_path.is_dir():
            continue

        # Skip excluded files/directories
        if any(pattern in str(file_path) for pattern in exclude_patterns):
            continue

        # Only check text files
        if not is_text_file(file_path):
            continue

        is_utf8, message = check_utf8_encoding(file_path)

        if is_utf8:
            print(f"✅ {file_path}: {message}")
        else:
            print(f"❌ {file_path}: {message}")
            non_utf8_files.append((file_path, message))

    print("=" * 60)

    if non_utf8_files:
        print(f"\nFound {len(non_utf8_files)} files with non-UTF-8 encoding:")
        for file_path, message in non_utf8_files:
            print(f"  - {file_path}: {message}")
        print("\nTo fix encoding issues:")
        print("  1. Convert files to UTF-8 using your text editor")
        print("  2. Or use: iconv -f <current-encoding> -t utf-8 <file> > <new-file>")
        print("  3. Or use: recode <current-encoding>..utf8 <file>")
        sys.exit(1)
    else:
        print("All text files are properly UTF-8 encoded!")
        sys.exit(0)

if __name__ == "__main__":
    main()
