
#-------------------------------------------------------------------------------------
#   Get-ExecutionPolicy
#                       Unrestricted | RemoteSigned | AllSigned | Restricted
#   Set-ExecutionPolicy Unrestricted -Scope Process
#-------------------------------------------------------------------------------------

# TESTED - when executed from PS Window ... 
#E:\Common\lbin\PowerShell\EditAndRename.ps1 testInFile.txt testOutFile.txt 'ReplaceMe' 'LESTER'

$inFile=$args[0]
$outFile=$args[1]
$replaceMe=$args[2]
$withThis=$args[3]

#echo $inFile
#echo $outFile
#echo $replaceMe
#echo $withThis

cat $inFile | % { $_ -replace $replaceMe, $withThis } > $outFile
Set-Content $outFile -Encoding ASCII -Value (Get-Content $outFile)
del $inFile