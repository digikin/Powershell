$L = (Get-WindowsOptionalFeature -Online | where FeatureName -eq Printing-Foundation-LPDPrintService)
$M = (Get-WindowsOptionalFeature -Online | where FeatureName -eq Printing-Foundation-LPRPortMonitor)
if ($L.state -eq "disabled"){enable-windowsoptionalfeature -Online -FeatureName "Printing-Foundation-LPDPrintService"}
if ($M.state -eq "disabled"){enable-windowsoptionalfeature -Online -FeatureName "Printing-Foundation-LPRPortMonitor"}

write-host "Features Enabled"

$queue = read-host -prompt "What is the queue #"

#Can be changed for any printer name
$Q = get-printer -Name *HP*
add-printer -name $queue -portname $Q.portname -drivername "Generic / Text Only"

$machine = Get-printer
foreach ($machine in $machines){
	IF($machine.PortName.Contains("USB")-and $machine.shared -eq $true){
		$machine.Name + ":" + $machine.shared
		$machine.shared = $false
		$machine.put()
	}
}




