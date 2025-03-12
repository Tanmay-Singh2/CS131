CommandName: sort_files

# sort_files Command

## What It Does
- **File Sorting:** If you provide a file, the command sorts its contents line-by-line.
- **Directory Organization:** If you provide a directory, the command organizes files into subdirectories based on their file extensions (for example, files with the .txt extension go to a folder named `txt_files`).

## Why It Is Useful
- **Automation:** Automates routine file management tasks, saving time.
- **Flexibility:** Works with any file or directory path provided by the user.
- **Error Reduction:** Minimizes manual errors by automating sorting and organization.

## How to Use
1. **Make the Script Executable:**  
   chmod 755 sort_files
2. **In the same directory where the file is:**  
   ./sort_files [Directory or file path]

## Here is a Sample Output

### for a single file

cat unsorted.txt

Line 3
Line 1
Line 2

#### ./sort_files unsorted.txt

Sorted the file 'unsorted.txt' by lines.

cat unsorted.txt
Line 1
Line 2
Line 3

### For a directory

ls test (contents of a messy directory)

file1.txt  file2.txt  page1.html  page2.html  unsorted.txt  csv1.csv  xml1.xml

#### ./sort_files test

Moved 'file1.txt' to 'txt_files/'  
Moved 'file2.txt' to 'txt_files/'  
Moved 'unsorted.txt' to 'txt_files/'  
Moved 'page1.html' to 'html_files/'  
Moved 'page2.html' to 'html_files/'  
Moved 'csv1.csv' to 'csv_files/'  
Moved 'xml1.xml' to 'xml_files/'  
Organized files in the directory 'test' by file extension.  

ls test  
csv_files  html_files  txt_files  xml_files  

