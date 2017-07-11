
#-------------------------------------------------------------------------------------
#   Get-ExecutionPolicy
#                       Unrestricted | RemoteSigned | AllSigned | Restricted
#   Set-ExecutionPolicy Unrestricted -Scope Process
#-------------------------------------------------------------------------------------

# TESTED - when executed from PS Window ... 
#E:\Common\lbin\PowerShell\StringReplaceDirectoryOfFiles.ps1 'directoryWithFinalSlash' 'ReplaceMe' 'WithMe'

#E:\Common\lbin\PowerShell\StringReplaceDirectoryOfFiles.ps1 'E:\Common\a' '_x002C_' '_x007C_'
#E:\Common\lbin\PowerShell\StringReplaceDirectoryOfFiles.ps1 'E:\Common\Management3D\TOC__\Software\SQL\NAV' 'v_' 'dbo.v_'

$directory=$args[0]
$replaceMe=$args[1]
$withThis=$args[2]

Set-Location -Path $directory

$files = Get-Item * -Include *.txt,*.dtsx,*.dtproj,*.sln,*.sql,*.cmd,*.xml

for ($i=0; $i -lt $files.Count; $i++) {
    $inFile = $files[$i].FullName
    $outFile = $inFile + "___TMP___" 
    #cat $inFile | % { $_ -replace $replaceMe, $withThis } > $outFile
    #                                                              7/7/16 change from "Default" to ASCII
    #                                                                                                        default is 80 *(
    cat $inFile | % { $_ -replace $replaceMe, $withThis } | Out-File -filepath $outFile -encoding "ASCII" -width 256
    del $inFile
    Rename-Item $outFile $inFile
}
