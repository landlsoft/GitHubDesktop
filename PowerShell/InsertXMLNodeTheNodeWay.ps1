
#-------------------------------------------------------------------------------------
#   Get-ExecutionPolicy
#                       Unrestricted | RemoteSigned | AllSigned | Restricted
#   Set-ExecutionPolicy Unrestricted -Scope Process
#-------------------------------------------------------------------------------------

# TESTED - when executed from PS Window ... 
#E:\Common\lbin\PowerShell\InsertXMLNode.ps1 'existingXMLFile'      'parentNodeXPath'       'newNodeXml'

# TESTED - when executed from PS Window ... 
#E:\Common\lbin\PowerShell\InsertXMLNodeTheNodeWay.ps1 'E:\Common\a\__CompanyDuJour_SSIS.dtproj'  '/Project/DTSPackages' '<DtsPackage FormatVersion="3"><Name>_DataSetBeta_Master.dtsx</Name><FullPath>_DataSetBeta_Master.dtsx</FullPath><References /></DtsPackage>'

# For Debugging, Uncomment these 4 lines, #Comment 3 lines below and then cut-n-paste from here into PS Window
#$aaa = @( 'E:\Common\a\test.xml', '//Project/DTSPackages', '<DtsPackage></DtsPackage>' )
#$file = $aaa[0]
#$parentNodeXPath = $aaa[1]
#$newNodeXml = $aaa[2]

# For Debugging, #Comment these 4 lines
$file = $args[0]
$parentNodeXPath = $args[1]
$newNodeXml = $args[2]

$xml = New-Object -TypeName XML
$xml.Load( $file )

# This returns 'SelectXmlInfo' type - PowerShell Specific
$parentXmlInfo = Select-XML -Xml $xml -XPath $parentNodeXPath
$parentNode = $parentXmlInfo.Node

#               | gm shows all Methods/Properties/Events of an object ... COOL :*)
#$parentXmlInfo | gm
#$parentXmlInfo.Node | gm
#                    vvvvvv Exposes Methods/Properties/Events otherwise hidden by PowerShell
#$parentXmlInfo.Node.PsBase | gm

# I was hoping there was a simple way to create a new node from 'newNodeXml', but no luck, so ... 
$xmlDeux = New-Object -TypeName XML
$xmlDeux.LoadXml( $newNodeXml )

# Now extract the node you want to add             vvvvvvv ... XPath to simply grab single top node
$newNodeXmlInfo = Select-XML -Xml $xmlDeux -XPath '(/*)[1]'
$newNode = $newNodeXmlInfo.Node

# $newNode is currently tied to $xmlDeux and can NOT be simply added to $parentNode, so ... 
# No Longer Needed ... $newNodeClone = $newNode.CloneNode( $true )

# I'm confused by the 'state' of $newNodeClone, I'd think I could .AppendChild to $parentNode.Node,
# but, you get error: The node to be inserted is from a different document context.
# So now I need to 'Import' that node into the $xml doc first ... 
# Actually, .ImportNode does NOT import the argument $newNode, in fact it does NOTHING to $newNode,
# it's still tied to $xmlDeux, so I can bypass the creation of the Clone above.  .ImportNode creates
# a new node that is a Clone of $newNode ... viola :*)
$newNodeClone = $parentNode.OwnerDocument.ImportNode( $newNode, $true )

$parentNode.AppendChild( $newNodeClone )

$xml.Save( $file )

