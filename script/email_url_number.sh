#!/bin/bash
# email_url_number.sh
egrep example.txt -o '[a-zA-Z0-9\._]+@[a-zA-Z0-9_]+\.[a-zA-Z]{2,4}' #电子邮件
egrep example.txt -o "http:// [a-zA-Z0-9\._]+\.[a-zA-Z0-9.]+\.[a-zA-Z]{2,4}" #网址
egrep example.txt -o '^\(?[2-9][0-9]{2}\)?(| |-|\.)[0-9]{3}(| |-|\.)[0-9]{4}' #美国电话号码，区号为2-9，
