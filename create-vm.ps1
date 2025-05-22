$resourceGroup = "MyResourceGroup"
$location = "canadacentral"
$vmName = "MyVM"

New-AzResourceGroup -Name $resourceGroup -Location $location -Force

# Read username and password from environment variables (set by GitHub Actions)
$vmUsername = $env:VM_USERNAME
$vmPasswordPlain = $env:VM_PASSWORD

# Convert plain password to secure string
$securePassword = ConvertTo-SecureString $vmPasswordPlain -AsPlainText -Force

# Create PSCredential object
$cred = New-Object System.Management.Automation.PSCredential ($vmUsername, $securePassword)

# Now use $cred in your VM creation command:
New-AzVM -ResourceGroupName $resourceGroup `
         -Name $vmName `
         -Location $location `
         -VirtualNetworkName $vnetName `
         -SubnetName $subnetName `
         -SecurityGroupName $nsgName `
         -PublicIpAddressName $pipName `
         -OpenPorts 3389,80 `
         -Credential $cred

