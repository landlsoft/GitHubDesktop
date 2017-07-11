
#-------------------------------------------------------------------------------------
#   Get-ExecutionPolicy
#                       Unrestricted | RemoteSigned | AllSigned | Restricted
#   Set-ExecutionPolicy Unrestricted -Scope Process
#-------------------------------------------------------------------------------------

# TESTED - when executed from PS Window ... 
#E:\Common\lbin\PowerShell\RenameDirectoryOfFiles.ps1 'directoryWithFinalSlash' 'ReplaceMe' 'WithMe'

#E:\Common\lbin\PowerShell\RenameDirectoryOfFiles.ps1 'E:\Common\a' 'Alphi' 'CompanyDuJour'
#E:\Common\lbin\PowerShell\RenameDirectoryOfFiles.ps1 'E:\Common\Management3D\_CompanyDuJour\Software\SQL\SubCompanyDuJour\TEMP' 'NAV' 'SubCompanyDuJour'

$directory=$args[0]
$replaceMe=$args[1]
$withThis=$args[2]

Set-Location -Path $directory

#This will recursively walk a directory and edit the name of all files and directories for you ... 
Get-ChildItem -Recurse * | Rename-Item -NewName { $_.name -Replace $replaceMe, $withThis }

# NOTES: 11/15/2016 - skips .suo files ??
