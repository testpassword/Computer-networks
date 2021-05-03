set f=ftp_commands.txt
echo "
open koyanet.lv 20
anonymous
anon
get debian/README.html ~\
" > %f%
ftp -s:%f%
del %f%