$ErrorActionPreference = "Stop"
$Services = Import-Csv $PSScriptRoot\etc\SERVICES_items_sorted_by_pl_displayname.csv -Encoding Default -Delimiter ";"
#$Services = Get-Service | Select-Object Name,DisplayName,Status,StartType 

foreach ($Service in $Services){
    try{
        Get-Service $Service.Name | Select-Object DisplayName,Name,Status,StartType

    }
    catch{
        Write-Host $Service.Name -ForegroundColor Black -BackgroundColor Yellow -NoNewline
        Write-Host " -- " $Service.DisplayName "  " -ForegroundColor Black -BackgroundColor Yellow -NoNewline
        Write-Host "<< service does not exist in current Windows Version" -ForegroundColor Black -BackgroundColor Red
    }
    
}

#$ArraySuccess | Format-Table
#$ArrayFail | Format-Table

#     Get-Process | Select-Object Id, Name, WS, Responding | foreach {

#         # Print 'red' row if WS greater than 100 MB
#         if([System.Math]::Round($_.WS/1MB,1) -match "^([0-9]|[0-9][0-9]|[1-9][0-9]?$|^100$)$"){
#             [console]::ForegroundColor="white"; $_;
#         } else {
#             [console]::ForegroundColor="red"; $_;
#         }
#     }
# }




# $Services | Format-Table Mode,@{
#     Label = "StartType"
#     Expression =
#     {
#         switch (Services.StartType)
#         {
#             'Manual' { $color = "93"; break }
#             'Automatic' { $color = '32'; break }
#             'Disabled' { $color = "35"; break }
#            default { $color = "0" }
#         }
#         $e = [char]27
#        "$e[${color}m$($_.Name)${e}[0m"
#     }
#  },Length


# Foreach ($service in $services){
#     # $myObject = [PSCustomObject]@{
#     #     Name = $service.Name
#     #     DisplayName = $service.DisplayName
#     #     Status = $service.Status
#     #     StartType = $service.StartType
#     # }

#     Write-Host $services.na

#     # if ($myObject.StartType -ne "Disabled") {
#     #     Write-Host $myObject -ForegroundColor Black -BackgroundColor Yellow| Format-Table | Out-String
#     # }
#     # else{
#     #     Write-Host $myObject| Format-Table | Out-String
#     # }

    
    
#     # Write-Host $myObject.Name -NoNewline
#     # Write-Host $tab ""$myObject.DisplayName -NoNewline
#     # Write-Host $tab ""$myObject.Status -NoNewline
#     # Write-Host $tab ""$myObject.StartType
    

# }

