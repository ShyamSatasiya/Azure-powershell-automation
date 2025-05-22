$resourceGroup = "MyResourceGroup"
$location = "canadacentral"
$vmName = "MyVM"

New-AzResourceGroup -Name $resourceGroup -Location $location

$cred = Get-Credential
New-AzVm `
  -ResourceGroupName $resourceGroup `
  -Name $vmName `
  -Location $location `
  -VirtualNetworkName "$vmName-VNet" `
  -SubnetName "$vmName-Subnet" `
  -SecurityGroupName "$vmName-NSG" `
  -PublicIpAddressName "$vmName-PIP" `
  -Credential $cred

