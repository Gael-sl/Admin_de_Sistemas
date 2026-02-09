Write-Host "=== Estado del sistema ==="
Write-Host "Hostname: $env:COMPUTERNAME"
Write-Host "IP red interna:"
(Get-NetIPAddress -AddressFamily IPv4 | Where-Object {$_.IPAddress -like "192.168.100.*"}).IPAddress
Write-Host "Espacio en disco:"
Get-Volume | Where-Object {$_.DriveLetter -eq 'C'} | ForEach-Object {
    Write-Host "Disco C: $([math]::Round($_.SizeRemaining/1GB,2)) GB libre de $([math]::Round($_.Size/1GB,2)) GB total"
}