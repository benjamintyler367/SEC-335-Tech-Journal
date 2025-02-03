param(
    [Parameter(Mandatory=$true)]
    [string]$NetworkPrefix,

    [Parameter(Mandatory=$true)]
    [string]$DnsServer
)

$startIp = 1
$endIp = 254

for ($i = $startIp; $i -le $endIp; $i++) {
    $ipAddress = "$NetworkPrefix.$i"
    try {
        $result = Resolve-DnsName -Name $ipAddress -Server $DnsServer -Type PTR -ErrorAction Stop
        Write-Output "IP: $ipAddress, Hostname: $($result.NameHost)"
    }
    catch {
        Write-Output "IP: $ipAddress, No reverse DNS record found"
    }

}

