function Connect-UebServer {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory=$true,Position=0)]
		[string] $Server,
		[Parameter(Mandatory=$true,Position=1)]
		[string] $User,
		[Parameter(Mandatory=$true,Position=2)]
        [string] $Password
	)

	$body =  @{
		username=$User;
		password=$Password;
	}

	$response = Invoke-RestMethod -Uri "https://$Server/api/login" -Method Post -Body (ConvertTo-Json -InputObject $body)
	$response

	$global:UebServer = $server
	$global:UebAuthHeader =  @{
		AuthToken=$response.auth_token;
	}
}


