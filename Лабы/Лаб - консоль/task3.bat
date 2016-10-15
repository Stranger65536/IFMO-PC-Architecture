dir /B *.tmp >DELETED.txt
for /F "delims=," %%i in (DELETED.txt) DO del "%%i"