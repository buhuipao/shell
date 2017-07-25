#!/bin/bash
# word_move 
sed 's/[^.]*buhuipao[^.]*\.//g' example.txt     #剃除含有buhuipao的那个句子,[^.]不含有.号，

find . -name "*.cpp" -print0 | xargs -I {} -0 sed -i 's/NAME/name/g' {}
find . -name ".*cpp" -exec sed -i 's/NAME/name/g' {} \;
find . -name ".*cpp" -exec sed -i 's/NAME/name/g' {} \+
var=1234567890
echo ${var/789/123}     #789替换为123
