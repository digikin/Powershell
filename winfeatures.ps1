$L = (Get-WindowsOptionalFeature -Online | where FeatureName -eq Printing-Foundation-LPDPrintService)
$M = (Get-WindowsOptionalFeature -Online | where FeatureName -eq Printing-Foundation-LPRPortMonitor)
if ($L.state -eq "disabled"){enable-windowsoptionalfeature -Online -FeatureName "Printing-Foundation-LPDPrintService"}
if ($M.state -eq "disabled"){enable-windowsoptionalfeature -Online -FeatureName "Printing-Foundation-LPRPortMonitor"}

$queue = 'Put queue # here"
$Q = get-printer -Name *HP*
add-printer -name $queue -portname $Q.portname -drivername "Generic / Text Only"



