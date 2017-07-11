
# WARNING: PS left one file corrupted.  Just $xml.Load( $file ) followed by $xml.Save( $file ), without me trying 
# to inject anything resulted in some sort of corruption. It appeared to just make some formatting changes, but 
# it would no longer work.  Due to the formatting changes, I couldn't just diff the two files to figure it out 
# and I opted not to take the time to go through it with a fine tooth comb to figure it out--for another day.

#-------------------------------------------------------------------------------------
#   Get-ExecutionPolicy
#                       Unrestricted | RemoteSigned | AllSigned | Restricted
#   Set-ExecutionPolicy Unrestricted -Scope Process
#-------------------------------------------------------------------------------------

#Usage: InsertXMLNodeFromString.ps1 'existingXMLFile' 'parentNodeXPath' 'newNodeText'

# TESTED - when executed from PS Window ... 
#E:\Common\lbin\PowerShell\InsertXMLNodeFromString.ps1 'E:\Common\a\__CompanyDuJour_SSIS.dtproj'  '/Project/DTSPackages' '<DtsPackage FormatVersion="3"><Name>_DataSetAlpha_Master.dtsx</Name><FullPath>_DataSetAlpha_Master.dtsx</FullPath><References /></DtsPackage>'

# IMPORTANT !!!!!! when running from within a CMD script via
#	powershell.exe "& E:\Common\... , you MUST ESCAPE " as \" ................................................................................ \"3\"

$file = $args[0]
$parentNodeXPath = $args[1]
$newNodeText = $args[2]

$xml = New-Object -TypeName XML
$xml.Load( $file )

$parentXmlInfo = Select-XML -Xml $xml -XPath $parentNodeXPath
$parentNode = $parentXmlInfo.Node.PsBase

$parentNode.InnerXml = $parentNode.InnerXml + $newNodeText

$xml.Save( $file )
