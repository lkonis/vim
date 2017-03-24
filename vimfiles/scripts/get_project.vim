cd %:p:h
let project_path= finddir('firmware',';')

" if cwd =~ "ccos"
"     let project_path= '..'
" endif 
" if cwd =~ "Newton"
"     let project_path= 'c:\Git\Newton_workspace\algo\firmware'
"     let project_binfw_path= 'c:\Git\Newton_workspace\bin\Debug\firmware\'
" endif 
" if cwd =~ "Farlander" 
"     let project_path= 'C:\TFS_Farlander3\Common\DSP\signalprocessing\app\app_trial\app_kitha'
"     let project_binfw_path= 'C:\TFS_Farlander3\Common\DSP\signalprocessing\app\app_trial\app_kitha'
" endif
" if cwd =~ "P6"
"     let project_path= 'c:\Git\Newton_in_Palp6\algo\firmware'
"     let project_binfw_path= 'c:\Git\P6_workspace\bin\GNR\Debug\firmware\'
" endif 
" if cwd =~ "DookuMain"
"     let project_path= 'c:\Git\DookuMain\Hi-platform\algo\firmware'
"     let project_binfw_path= 'c:\Git\DookuMain\Hi-platform\bin\Debug\firmware\'
" endif 
" if cwd =~ "Dooku_work"
"     let project_path= 'c:\Git\Dooku_workspace\algo\firmware'
"     let project_binfw_path= 'c:\Git\Dooku_workspace\bin\Debug\firmware\'
" endif 
" if cwd =~ "tabasco"
"     let project_path= 'c:\Tfs\tabasco\Main\Palpatine4\DSP\Signalprocessing_C4\'
" endif 
" if cwd =~ "palp5"
"     let project_path= 'c:\Tfs\tabasco\Main\Palpatine4\DSP\Signalprocessing_C4\'
" endif 
" :set pa+='project_path'
