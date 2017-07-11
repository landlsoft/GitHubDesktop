
#-------------------------------------------------------------------------------------
#   Get-ExecutionPolicy
#                       Unrestricted | RemoteSigned | AllSigned | Restricted
#   Set-ExecutionPolicy Unrestricted -Scope Process
#-------------------------------------------------------------------------------------

# TESTED - when executed from PS Window ... 
#E:\Common\lbin\PowerShell\RenameAndEditDirectoryOfFiles.ps1 'directoryWithFinalSlash' 'ReplaceMe' 'WithMe'

#E:\Common\lbin\PowerShell\RenameAndEditDirectoryOfFiles.ps1 'E:\Common\a' 'Alphi' 'CompanyDuJour'
#E:\Common\lbin\PowerShell\RenameAndEditDirectoryOfFiles.ps1 'E:\Common\Management3D\_CompanyDuJour\Software\SQL\SubCompanyDuJour\NAV__' 'NAV' 'SubCompanyDuJour'

$directory=$args[0]
$replaceMe=$args[1]
$withThis=$args[2]

Set-Location -Path $directory

Get-ChildItem *.* | Rename-Item -NewName { $_.name -Replace $replaceMe, $withThis }

#$files = Get-ChildItem -File $directory

# First rename the files ... 

#for ($i=0; $i -lt $files.Count; $i++) {
#    $inFile = $files[$i].FullName
#    $outFile = $inFile.Replace( $replaceMe, $withThis )
#    Rename-Item $inFile $outFile
#}

E:\Common\lbin\PowerShell\StringReplaceDirectoryOfFiles.ps1 $directory $replaceMe $withThis