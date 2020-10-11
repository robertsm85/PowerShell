Import-Module ActiveDirectory

$ou=read-host "Enter the OU Distinguished Name"

$allUsers = Get-ADUser -SearchBase "$OU" -Filter {(UserPrincipalName -like "*")} -Properties cn,displayName

foreach ( $u in $allUsers | Where-Object { ($_.givenName) -and ($_.surName) } ) {
    $fn = $u.givenName.Trim()
    $ln = $u.surName.Trim()
    Set-ADUser -Identity $u -DisplayName "$fn $ln" -GivenName "$fn" -SurName "$ln" -PassThru | Rename-ADObject -NewName "$fn $ln"
}
