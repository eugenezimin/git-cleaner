# Git Cleaner

This script helps you clean the history of a Git repository by deleting a specified file from the whole repository's history. It might be important to remove sensitive information from the repository's history, like passwords, API keys, or other confidential data, which may be stored in `.env` filed, or similar to them.

## Prerequisites

- Java must be installed on your system.
- `tput` must be installed on your system.
- The BFG Repo-Cleaner (`bfg`) must be present in the local directory.

## Usage

**Ensure prerequisites are met:**
- Java is installed.
- `tput` is installed.
- The BFG Repo-Cleaner (`bfg`) is in the local directory.

To run the `git-cleaner.sh` script, you need to ensure that all prerequisites are met and then execute the script with the necessary inputs. Here is an example of a full working command sequence:

  1. Open your terminal.
  2. Navigate to the directory containing the `git-cleaner.sh` script.
  3. Run the script:

```bash
./git-cleaner.sh
```

4. Follow the prompts:

```plaintext
######################################################
#              Git Repo History Cleaner              #
######################################################

Enter path to repo to clean (absolute): /path/to/your/repo
Enter the filename to delete (from repo's root): sensitive_file.txt
The following file will be deleted: sensitive_file.txt

Do you want to continue? (y/n): y
Deleting...
```

Make sure to replace `/path/to/your/repo` with the absolute path to your Git repository and `sensitive_file.txt` with the filename you want to delete from the repository's history.
## Notes

- Ensure the repository path is correct and the repository exists.
- Ensure the filename is correct and not empty.
- The script will prompt for confirmation before proceeding with the deletion.