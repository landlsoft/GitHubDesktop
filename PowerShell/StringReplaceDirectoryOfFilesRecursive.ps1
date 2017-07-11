
#-------------------------------------------------------------------------------------
#   Get-ExecutionPolicy
#                       Unrestricted | RemoteSigned | AllSigned | Restricted
#   Set-ExecutionPolicy Unrestricted -Scope Process
#-------------------------------------------------------------------------------------


# Usage: EditDirectoryOfFilesRecursively.ps1 'FullPathOfRootDirectory' 'ReplaceMe' 'WithMe'


# TESTED - when executed from PS Window ... 
#E:\Common\lbin\PowerShell\EditDirectoryOfFilesRecursively.ps1 'E:\Common\a' '_x002C_' '_x007C_'
#E:\Common\lbin\PowerShell\EditDirectoryOfFilesRecursively.ps1 'E:\Common\Landlsoft\TOC__\Software\SQL\NAV' 'v_' 'dbo.v_'

$directory=$args[0]
$replaceMe=$args[1]
$withThis=$args[2]

Set-Location -Path $directory

$files = Get-ChildItem -Recurse -Include *.txt,*.dtsx,*.dtproj,*.sln,*.sql,*.cmd,*.xml

for ($i=0; $i -lt $files.Count; $i++) {
    $inFile = $files[$i].FullName
    $outFile = $inFile + "___TMP___" 
    #                                                              7/7/16 change from "Default" to ASCII
    #                                                                                                        default is 80 *(
    cat $inFile | % { $_ -replace $replaceMe, $withThis } | Out-File -filepath $outFile -encoding "ASCII" -width 256
    del $inFile
    Rename-Item $outFile $inFile
}
