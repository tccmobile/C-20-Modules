alias g++="`\
# gets and outputs all the possible directories that are searched for executables (just outputs the PATH environment variable) \
echo $PATH  \
# formats them into something more manageable (just replaces the colons which separates each directory entry with newlines) \
| sed s/:/'\n'/g \
# finds the directory that holds the version of gcc capable of compiling c++20 programs (version 11.x.x) \
| grep 'gcc-11' -
`/g++"

shopt -s globstar                # makes it so that the special glob "**" will match all files/directories in the specified directory AND in any subdirectories. (basically recusive file globbing)
CPP_FILES="$(echo src/**.cpp)"   # gets all the implementation files in the src directory and its subdirectories.

g++ -std=c++20 $CPP_FILES -o main && ./main    # compiles and, if valid, executes the discovered implementation files.



