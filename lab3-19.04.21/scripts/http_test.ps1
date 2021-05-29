$U = 'http://kulbakoay.ddns.net'
$M = 'GET'
Invoke-WebRequest -Uri $U -Method $M
Invoke-WebRequest -Uri $U -Method $M -Headers @{ 'If-Modified-Since' = 'Sun, 02 May 2021 19:14:39 GMT' }