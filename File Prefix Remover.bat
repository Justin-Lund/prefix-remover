@echo off
:: Filename Prefix Remover
:: https://github.com/Justin-Lund/
:: https://soundcloud.com/MartianMoon

title Filename Prefix Remover


:Start

echo Proceeding will rename all .WAV, .AIF, .MP3 ^& .ASD files in this folder
echo Any prefix amongst the files will be removed (anything to the left of the first space in the file name)
echo eg. "Song Bass.wav" ^& "Song Lead.wav" will be renamed to "Bass.wav" ^& "Lead.wav" respectively
echo.
echo However, if there is a 2nd space in the prefix, it will only remove the first word
echo eg. "Song Title Bass.wav" will be renamed to "Title Bass.wav"
echo This can be solved by simply running this script twice.
echo.

Set /p Proceed=Proceed? (Y/N):
if /i "%Proceed%" Neq "Y" exit


:RemovePrefix

for /F "eol=| delims=" %%A in ('dir "* *.wav" /A-D-H /B 2^>nul') do for /F "eol=| tokens=1*" %%B in ("%%A") do ren "%%A" "%%C"
for /F "eol=| delims=" %%A in ('dir "* *.aif" /A-D-H /B 2^>nul') do for /F "eol=| tokens=1*" %%B in ("%%A") do ren "%%A" "%%C"
for /F "eol=| delims=" %%A in ('dir "* *.mp3" /A-D-H /B 2^>nul') do for /F "eol=| tokens=1*" %%B in ("%%A") do ren "%%A" "%%C"
for /F "eol=| delims=" %%A in ('dir "* *.asd" /A-D-H /B 2^>nul') do for /F "eol=| tokens=1*" %%B in ("%%A") do ren "%%A" "%%C"

exit
