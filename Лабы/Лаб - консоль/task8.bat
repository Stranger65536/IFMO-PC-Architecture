mkdir ASCNkjascnmaAS
move *.doc ASCNkjascnmaAS
dir /B ASCNkjascnmaAS/*.doc > renfile.txt
cd ASCNkjascnmaAS
ren W*.doc V*.rtf & ren *.doc *.rtf
dir /B *.rtf >> ../renfile.txt
move /y * ../
cd ..
rmdir /Q ASCNkjascnmaAS