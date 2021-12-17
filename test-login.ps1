
#New-Item -path /Users/nafeesa/Downloads/nafees -Name test1.txt 
"hello who are you cool2" | Out-File  /Users/nafeesa/Downloads/nafees/test.txt -Append
# Remove-Item -Path /Users/nafeesa/Downloads/nafees -Name test2.txt 

############################################################################################################
# command to login
Connect-AzAccount
############################################################################################################

#get az context
Get-AzContextAutosaveSetting
Get-AzContextAutosaveSetting -Scope CurrentUser

############################################################################################################
#get storage account list
Get-AzStorageAccount

#get storage account
$storageAccount = Get-AzStorageAccount -Name "hereteststorageaccount" -ResourceGroupName "storage-account-test-RG"

Get-AzStorageAccount -ResourceGroupName "storage-account-test-RG"
############################################################################################################

############################################################################################################
#create new stoarge account --TODO check for full parameters
New-AzStorageAccount  -ResourceGroupName "storage-account-test-RG" -Name "hereteststorageaccount" -SkuName "Standard_LRS" -Location 
############################################################################################################

############################################################################################################
#delete storage account
Remove-AzStorageAccount  -ResourceGroupName "storage-account-test-RG" -Name "hereteststorageaccount" -Force
############################################################################################################

############################################################################################################
#list storageContainer 
Get-AzRmStorageContainer -ResourceGroupName "storage-account-test-RG" -AccountName "hereteststorageaccount"
############################################################################################################

############################################################################################################
#create storage container
new-AzRmStorageContainer -ResourceGroupName "storage-account-test-RG" -AccountName "hereteststorageaccount" -name "logs1"
############################################################################################################

############################################################################################################
#delete storageContainer from storage account
Get-AzRmStorageContainer -ResourceGroupName "storage-account-test-RG" -AccountName "hereteststorageaccount" | Remove-AzRmStorageContainer -Force
############################################################################################################


############################################################################################################
#celar variables
Clear-Variable -name "context"
############################################################################################################


############################################################################################################
#create new storage queue  
$storageAccount = Get-AzStorageAccount -Name "hereteststorageaccount" -ResourceGroupName "storage-account-test-RG"
$context = $storageAccount.Context
$queueName = "powershelltoqueue1"
$queue = New-AzStorageQueue –Name $queueName -Context $context

############################################################################################################


############################################################################################################
#get storage Queue list 
$storageAccount = Get-AzStorageAccount -Name "hereteststorageaccount" -ResourceGroupName "storage-account-test-RG"
$context = $storageAccount.Context
Get-AzStorageQueue -Context $context 

############################################################################################################

############################################################################################################
#delete storage Queue   
$storageAccount = Get-AzStorageAccount -Name "hereteststorageaccount" -ResourceGroupName "storage-account-test-RG"
$context = $storageAccount.Context
Get-AzStorageQueue -Context $context | Remove-AzStorageQueue -Force

############################################################################################################



