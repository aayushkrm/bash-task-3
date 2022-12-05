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

## To use the topsize script, save it to a file named `topsize` (or any other name) and make it executable with the `chmod` command:

`$ chmod +x topsize`

Then, you can run the script with the following command line syntax:



`$ topsize [-h] [-N num] [-s minsize] [--] [dir/user]`
where the options have the following meanings:

`-h`: print human-readable sizes (optimal choice for units, i.e. KiB, MiB, etc.)
`-N` num: number of files (print all files, if not given)
`-s` minsize: minimal file size (1 byte, if not given), e.g. -s 1024 to print only files larger than 1K
`dir`: lookup directory (current, if not given)
`--`: option and non-option argument separator (to support directory names starting with -)
For example, the following command will print at most 10 files larger than 512 bytes in the /home/user directory and its all subdirectories:


`$ topsize -10 -s 512 /home/user`
The output will be a list of file sizes and paths, one file per line, in descending order of size.

To print human-readable sizes, use the -h option:

`$ topsize -h -10 -s 512 /home/user`

To print all files, omit the -N option:

`$ topsize -s 512 /home/user`

To print all files in the current directory, omit the directory argument:

`$ topsize -s 512`

To print help and exit, use the --help or -h option:

`$ topsize --help`
`$ topsize -h`

### Note that the topsize script will exit with an error message and a non-zero exit status if any of the following conditions are met:

the `dir` argument is not a directory
an unknown option is passed to the script
the `--`separator is not used before the dir argument when needed

For example:

```$ topsize -10 -s 512 /non/existing/dir```

```Error: /non/existing/dir is not a directory```
