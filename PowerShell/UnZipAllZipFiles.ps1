
#-------------------------------------------------------------------------------------
#   Get-ExecutionPolicy
#                       Unrestricted | RemoteSigned | AllSigned | Restricted
#
#   Set-ExecutionPolicy Unrestricted -Scope Process
#-------------------------------------------------------------------------------------

# TESTED - when executed from PS Window ... 
#E:\Common\lbin\PowerShell\UnZipAllZipFiles.ps1 'SrcDirectoryWithFinalSlash' 'OutputDirectory'

#D:\Mgmt3D\UnZipAllZipFiles.ps1 'D:\Mgmt3D\RadioShack\Data\Inventory\ZIP_Files\' 'D:\Mgmt3D\RadioShack\Data\Inventory\ZIP_Files\'

$inDir=$args[0]
$outputDir=$args[1]

$files = Get-ChildItem $inDir -filter "*.zip"

for ($i=0; $i -lt $files.Count; $i++) {
    $inFile = $files[$i].FullName
    Set-Location $outputDir
    C:\Mgmt3D\RadioShack\Bin\7za.exe e $inFile -y
}
