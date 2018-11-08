$L = (Get-WindowsOptionalFeature -Online | where FeatureName -eq Printing-Foundation-LPDPrintService)
$M = (Get-WindowsOptionalFeature -Online | where FeatureName -eq Printing-Foundation-LPRPortMonitor)
if ($L.state -eq "disabled"){enable-windowsoptionalfeature -Online -FeatureName "Printing-Foundation-LPDPrintService"}
if ($M.state -eq "disabled"){enable-windowsoptionalfeature -Online -FeatureName "Printing-Foundation-LPRPortMonitor"}

