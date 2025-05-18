# SystemInfoReport.ps1
$report = @{
    'Computer Name' = $env:COMPUTERNAME
    'User Name'     = $env:USERNAME
    'OS Version'    = (Get-CimInstance Win32_OperatingSystem).Caption
    'Uptime (hrs)'  = "{0:N2}" -f ((Get-Date) - (gcim Win32_OperatingSystem).LastBootUpTime).TotalHours
    'CPU'           = (Get-CimInstance Win32_Processor).Name
    'Total RAM (GB)'= "{0:N2}" -f ((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB)
    'Disk Usage'    = (Get-PSDrive C).Used / 1GB -as [int]
}

$report | Out-File -FilePath "SystemReport.txt"
Write-Output "System report saved to SystemReport.txt"
