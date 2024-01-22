#Script ini digunakan untuk get list user beserta status license nya
Install-Module MSOnline
Connect-MsolService
Get-MsolUser -All |where-object {$_.UserPrincipalName -like "*@mainan.cloud"}
