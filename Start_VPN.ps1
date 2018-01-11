#Variables list. Replace variables and/or add more applications as needed.
[String] $Server = "Redwing"
[String] $BaseApplication = "vpnui.exe"
[String] $Application1 = "lync.exe"
[String] $Application2 = "terminals.exe"

#Starts Cisco VPN Client.
start-process $BaseApplication

#Tests connection to DC.
Do {
$Connected=test-connection -computer $Server -Count 1 -Quiet
"Attempting to ping Domain Controller."
}

#Waits for connection to succeed.
Until ($Connected -eq "True")
"Ping to Domain Controller sucessful."

#Starts applications.
start-process $Application1
start-process $Application2