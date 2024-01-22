$AdminSiteURL="https://roc9-admin.sharepoint.com"
$ReportOutput="C:\Users\rafli.alkindhi.IMMOBISP\Downloads\SPOStorage.csv"
$SiteCollections = Get-SPOSite -IncludePersonalSite $true -Limit All
Write-Host "Total Number of Site collections Found:"$SiteCollections.count -f Yellow
$ResultSet = @()
Foreach($Site in $SiteCollections)
{
  Write-Host "Processing Site Collection :"$Site.URL -f Yellow
  #Send the Result to CSV
  $Result = new-object PSObject
  $Result| add-member -membertype NoteProperty -name "SiteURL" -Value $Site.URL
  $Result | add-member -membertype NoteProperty -name "Allocated" -Value $Site.StorageQuota
  $Result | add-member -membertype NoteProperty -name "Used" -Value $Site.StorageUsageCurrent
  $Result | add-member -membertype NoteProperty -name "Warning Level" -Value  $site.StorageQuotaWarningLevel
  $ResultSet += $Result
}
$ResultSet | Export-Csv $ReportOutput -notypeinformation
#Export Result to csv file
$ResultSet |  Export-Csv $ReportOutput -notypeinformation
Write-Host "Site Quota Report Generated Successfully!" -f Green
