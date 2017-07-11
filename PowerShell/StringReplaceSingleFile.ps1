
#-------------------------------------------------------------------------------------
#   Get-ExecutionPolicy
#                       Unrestricted | RemoteSigned | AllSigned | Restricted
#   Set-ExecutionPolicy Unrestricted -Scope Process
#-------------------------------------------------------------------------------------

# TESTED - when executed from PS Window ... 
#E:\Common\lbin\PowerShell\StringReplaceSingleFile.ps1 'file' 'ReplaceMe' 'WithMe'

#E:\Common\lbin\PowerShell\StringReplaceSingleFile.ps1 'E:\Common\a\TestDeux.txt' '__TOK__GUIDRef__1__' '111-222-333'

$file=$args[0]
$replaceMe=$args[1]
$withThis=$args[2]

$outFile = $file + "___TMP___" 
#                                                                                                default is 80 *(
cat $file | % { $_ -replace $replaceMe, $withThis } | Out-File -filepath $outFile -encoding "ASCII" -width 256
del $file
Rename-Item $outFile $file

