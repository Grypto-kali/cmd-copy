# Backup Script

This script performs a backup of the C: drive, excluding the Windows directory, to a target directory named after the computer in which the script is executed. The target directory is created in the same location as the script.

## How to Use

1. **Run as Administrator:** Ensure the script is executed with administrative privileges to have the necessary permissions for file operations.
2. **Start the Script:** Simply run the script. It will create a backup folder in the same directory where the script is located.

### Prerequisites

- **Windows OS:** This script is designed to run on Windows operating systems.
- **Administrator Privileges:** The script requests administrative privileges if not already run as an administrator.

## Script Details

The script performs the following steps:

1. **Check for Administrative Privileges:** If not run as an administrator, it requests the necessary permissions.
2. **Define Source and Target Directories:**
     - **Source:** The entire C: drive, excluding the Windows directory.
    - **Target:** A folder named after the computer in the same directory as the script.
3. **Create Target Directory:** If the target directory does not exist, it is created.
4. **Copy Files:** All files and directories from the source, excluding the Windows directory, are copied to the target directory.
5. **Pause:** The script pauses upon completion to display the result of the copy operation.
