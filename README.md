# Task 3

Write a script to print top N largest (top size) files larger than the specified size in the given directory and all its subdirectories. The output should contain file size and file path (starting with the given directory), one file per line, in size descending order.



 

Script command line syntax:

 

`topsize [--help] [-h] [-N] [-s minsize] [--] [dir]`

 

where

 

`--help` - print help and exit
`-N` - number of files, e.g. -10 to print top-10 files (print all files, if not given)
`minsize` - minimal file size (1 byte, if not given), e.g. -s 1024 to print only files larger than 1K
`-h` - print human-readable size (optimal choice for units, i.e. KiB, MiB, etc. - not mandatory)
`dir` - lookup directory (current, if not given)
`--` - option and non-option argument separator (to support dir names starting with -)
Support all common error messages (command syntax) and exit statuses.

 

`topsize -10 -s 512 /home/user`

 

`topsize -10 /home/user -s 512`

 

print at most 10 files larger than 512 bytes in /home/user directory and its all subdirectories

 

`topsize -5 -- -10`

 

print at most 5 files larger than 1 byte in -10 directory and its all subdirectories

 

Note. Use `find` to find matching files (e.g., exceeding specified size). Use `sort` and `head` to select top N files. Use find `-printf "%s %p`to print sizes (except human-readable case) or parse the output of `du` command (n.b. to use `du -b` option to find file size in bytes).
