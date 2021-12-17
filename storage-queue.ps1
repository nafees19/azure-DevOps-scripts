function deleteStoragefunctionQueue()
{
    $fnResourceGroupName = "storage-account-test-RG"
    $storageAccount = Get-AzStorageAccount -ResourceGroupName $fnResourceGroupName
    $context = $storageAccount.Context
    $queuelist = Get-AzStorageQueue -Context $context 

    if($queuelist.count -gt 0){
       

        Write-Host ("Number of existing queue are [{0}], start queue deletion.. "-f $queuelist.count)
        Get-AzStorageQueue -Context $context | Remove-AzStorageQueue -Force


    } 
    else{
        Write-Host ("There are no Queue exist, doing nothing "-f $queuelist.count)
    }
    
    $queuelist = Get-AzStorageQueue -Context $context 
    Write-Host ("Number of queue [{0}] "-f $queuelist.count)

}

function createStoragefunctionQueue {

$fnResourceGroupName = "storage-account-test-RG"
$storageAccount = Get-AzStorageAccount -ResourceGroupName $fnResourceGroupName
$context = $storageAccount.Context

New-AzStorageQueue –Name 'powershelltoqueue3' -Context $context
New-AzStorageQueue –Name 'powershelltoqueue31' -Context $context
New-AzStorageQueue –Name 'powershelltoqueue32' -Context $context
New-AzStorageQueue –Name 'powershelltoqueue33' -Context $context
$Queuelist = Get-AzStorageQueue -Context $context
$Queuelist  
}