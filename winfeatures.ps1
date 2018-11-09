$L = (Get-WindowsOptionalFeature -Online | where FeatureName -eq Printing-Foundation-LPDPrintService)
$M = (Get-WindowsOptionalFeature -Online | where FeatureName -eq Printing-Foundation-LPRPortMonitor)
if ($L.state -eq "disabled"){enable-windowsoptionalfeature -Online -FeatureName "Printing-Foundation-LPDPrintService"}
if ($M.state -eq "disabled"){enable-windowsoptionalfeature -Online -FeatureName "Printing-Foundation-LPRPortMonitor"}

write-host "Features Enabled"

$queue = read-host -prompt "What is the queue #"

#Can be changed for any printer name
$Q = get-printer -Name *HP*
add-printer -name $queue -portname $Q.portname -drivername "Generic / Text Only"

$printers = Get-Wmi-WMIObject -class Win32_Printer -computer localhost
foreach ($printer in $printers){
	IF($Printer.PortName.Contains("USB")-and $printer.published -eq $true){
		$printer.Name + ":" + $printer.published
		$printer.published = $false
		$printer.put()
	}
}




