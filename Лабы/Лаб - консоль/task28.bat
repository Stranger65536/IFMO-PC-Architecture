dir /B C:\ > listroot.txt
for %%i in (listroot.txt,config.sys,autoexec.bat) do copy /y "%%i" D:\