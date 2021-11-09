# archive.tar.gz
echo ${file1%.*}     # Right to left (less)
echo ${file1%%.*}    # Right to left (more)
echo ${file1#*.}     # Left to right (less)
echo ${file1##*.}    # Left to right (more)
echo ${file1:-file2} # If STR is null, it is substituted with word
echo ${file1:=file2} # If STR is null, word is assigned to STR
