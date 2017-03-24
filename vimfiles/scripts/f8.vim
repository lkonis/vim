let cwd=getcwd()
if cwd =~ "Palpatine5"
    let project_path= 'c:\Tfs\tabasco\Main\Palpatine4\DSP\Signalprocessing_C4\'
    cd `=project_path`
    vimgrep // app\app_trial\App_CalamaryCruiser\*.c mod\*\inc\*.h mod\*\src\*.h mod\*\src\*.c inc\*.h
endif 
if cwd =~ "palp6"
    let project_path= 'C:\git\Newton_in_palp6\algo\firmware'
    cd `=project_path`
    vimgrep // inc\*shared* app\App_Audio\*.c mod\dmnr\inc\*.h mod\hmdl_lght\src\*.h mod\hmdl_lght\src\*.c mod\dmnr\src\*.c inc\*.h
endif 
if cwd =~ "Farlander" 
    let project_path= 'C:\TFS_Farlander3\Common\DSP\signalprocessing\app\app_trial\app_kitha'
    cd `=project_path`
    vimgrep // *.c ..\..\..\mod\*\src\*.c ..\..\..\inc\*
endif
if cwd =~ "Dooku_workspace"
    let project_path= 'c:\git\Dooku_workspace\algo\firmware'
    cd `=project_path`
    vimgrep // inc\*shared* app\App_Audio\*.c mod\dmnr\inc\*.h mod\codec\src\*.c mod\dmnr\src\*.c inc\*.h
endif 
if cwd =~ "DookuMain"
    let project_path= 'c:\git\DookuMain\hi-platform\algo\firmware'
    cd `=project_path`
    vimgrep // inc\*shared* app\App_Audio\*.c mod\dmnr\inc\*.h mod\codec\src\*.c mod\dmnr\src\*.c inc\*.h
endif 
