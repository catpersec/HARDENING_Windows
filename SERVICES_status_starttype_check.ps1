$services = Get-Service | select Name,DisplayName,Status,StartType
Foreach ($service in $services){
    $myObject = [PSCustomObject]@{
        Name = $service.Name
        DisplayName = $service.DisplayName
        Status = $service.Status
        StartType = $service.StartType
    }

    if ($myObject.StartType -ne "Disabled") {
        Write-Host $myObject -ForegroundColor Black -BackgroundColor Yellow| Format-Table | Out-String
    }
    else{
        Write-Host $myObject| Format-Table | Out-String
    }
}