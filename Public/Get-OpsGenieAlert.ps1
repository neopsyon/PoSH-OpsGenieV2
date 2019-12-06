Function Get-OpsGenieAlert {
    [CmdletBinding()]
    param (
        # Parameter help description
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]$AlertID,
        # Parameter help description
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$ApiKey,
        # Parameter help description
        [Parameter(Mandatory=$true)]
        [ValidateSet('ID','TinyID','Alias')]
        [string]$IDType
    )
    process {
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
        $Headers = @{
            'Authorization' = "GenieKey $($ApiKey)"
        }
        $Uri = 'https://api.opsgenie.com/v2/alerts/'
        $RestSplat = @{
            Method      = 'Get'
            Headers     = $Headers
            ContentType = 'application/json'
        }
        foreach ($Alert in $AlertID) {
            if ($IDType -eq 'ID') {
                $Uri = $Uri + "$($Alert)?identifierType=id"
                $RestSplat.Add('Uri',$Uri)
                $Data = Invoke-RestMethod @RestSplat
                $Data.data
            }
            if ($IDType -eq 'TinyID') {
                $Uri = $Uri + "$($Alert)?identifierType=tiny"
                $RestSplat.Add('Uri',$Uri)
                $Data = Invoke-RestMethod @RestSplat
                $Data.data
            }
            if ($IDType -eq 'Alias') {
                $Uri = $Uri + "$($Alert)?identifierType=alias"
                $RestSplat.Add('Uri',$Uri)
                $Data = Invoke-RestMethod @RestSplat
                $Data.data
            }
        }
    }
}