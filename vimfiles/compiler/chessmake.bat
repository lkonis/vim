REM Sript for compieling the AudioApp

REM @build /p %1

set project=%1

set IPP=I-2014.03-SP1-1
set compiler=ipp-coyote5-f16
set compilerPath="c:\Synopsys\"%compiler%"\"%IPP%"\win32\bin\WINbin\chessmk.exe"

echo Building App
%compilerPath% %project% -C Debug +P 7

:END

                                                           


