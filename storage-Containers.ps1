function deleteStoragefunctionContainers()
{
    $fnResourceGroupName = "storage-account-test-RG"

    $storageAccount = (Get-AzStorageAccount -ResourceGroupName $fnResourceGroupName).StorageAccountName

    $containerlist = Get-AzRmStorageContainer -ResourceGroupName $fnResourceGroupName -AccountName $storageAccount

    if($containerlist.count -gt 0){
       

        Write-Host ("Number of existing Containers are [{0}], start Containers deletion.. "-f $containerlist.count)
        Get-AzRmStorageContainer -ResourceGroupName $fnResourceGroupName -AccountName $storageAccount | Remove-AzRmStorageContainer -Force


    } 
    else{
        Write-Host ("There are no Container exist, doing nothing ")
    }
    
    $containerlist = Get-AzRmStorageContainer -ResourceGroupName $fnResourceGroupName -AccountName $storageAccount
    Write-Host ("Number of containers [{0}] "-f $containerlist.count)

}

function deleteStoragefunctionContainers2()
{

    $fnResourceGroupName = "storage-account-test-RG"
    $storageAccount = Get-AzStorageAccount -ResourceGroupName $fnResourceGroupName
    $context = $storageAccount.Context
    $containerlist =  Get-AzStorageContainer -Context $context

    if($containerlist.count -gt 0){
       

        Write-Host ("Number of existing Containers are [{0}], start Containers deletion.. "-f $containerlist.count)
        Get-AzStorageContainer -Context $context | Remove-AzStorageContainer -Force


    } 
    else{
        Write-Host ("There are no Container exist, doing nothing ")
    }
    
    $containerlist =  Get-AzStorageContainer -Context $context
    Write-Host ("Number of containers [{0}] "-f $containerlist.count)

}

function createStoragefunctioncontainers{

$fnResourceGroupName = "storage-account-test-RG"

$storageAccount = (Get-AzStorageAccount -ResourceGroupName $fnResourceGroupName).StorageAccountName
$storageAccount

new-AzRmStorageContainer -ResourceGroupName $fnResourceGroupName -AccountName $storageAccount -name "container1"
new-AzRmStorageContainer -ResourceGroupName $fnResourceGroupName -AccountName $storageAccount -name "container2"
new-AzRmStorageContainer -ResourceGroupName $fnResourceGroupName -AccountName $storageAccount -name "container3"
new-AzRmStorageContainer -ResourceGroupName $fnResourceGroupName -AccountName $storageAccount -name "container4"
$containerlist = Get-AzRmStorageContainer -ResourceGroupName $fnResourceGroupName -AccountName $storageAccount
Write-Host ("Number of existing Containers are [{0}]. "-f $containerlist.count)
 
}

function createStoragefunctioncontainers2{

    $fnResourceGroupName = "storage-account-test-RG"
    $storageAccount = Get-AzStorageAccount -ResourceGroupName $fnResourceGroupName
    $context = $storageAccount.Context
    Get-AzStorageContainer -Context $context

    new-AzStorageContainer -Context $context -name "container1"
    new-AzStorageContainer -Context $context -name "container2"
    new-AzStorageContainer -Context $context -name "container3"
    new-AzStorageContainer -Context $context -name "container4"
    $containerlist = Get-AzStorageContainer -Context $context
    Write-Host ("Number of existing Containers are [{0}]. "-f $containerlist.count)
     
    }