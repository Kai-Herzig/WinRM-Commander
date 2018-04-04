#GitHub: https://github.com/Kai-Herzig/WinRM-Commander
#Author: Kai Herzig (https://github.com/Kai-Herzig), Heiko Neblung (https://github.com/ThirstySpace)
#Date: 04.04.2018

#---Variables
$popup = New-Object -ComObject WScript.Shell
$ServerString = ""

#---Script

#Get and Choose Server List from AD
$Servers = Get-ADComputer -Filter * | select-object DNSHostName | sort DNSHostName | Out-GridView -Title "Select Computers for Command Execution" -PassThru

#Create Server String for Display in Popup
foreach ($Server in $Servers)
{
    $ServerString += $Server.DNSHostName + "`n"

}

#Get and Choose Command from Textfile
$Command = Get-ChildItem -Path C:\Scripts\Commands | Out-GridView -Title "Select Command" -PassThru

#Build ScriptBlock for Invoke-Command (WinRM)
$ScriptBlock = [ScriptBlock]::Create($(Get-Content $Command.FullName))

#Popup for confirmation
$popAnswer = $popup.popup("Do you want to run this command:`n`n$ScriptBlock`n`non the following servers:`n`n$ServerString`n",0,"Run",4)

#Run Command for chosen Servers
if($popAnswer -eq 6)
{
    write-host "Command`n`n$ScriptBlock`n`nfor Servers`n`n$ServerString`nconfirmed`n"

    foreach ($Server in $Servers)
    {
        try{
            Write-Host $ScriptBlock
            Invoke-Command -ComputerName $($Server.DNSHostName) -ScriptBlock $ScriptBlock -ErrorAction Stop
            Write-Host -f Green "Server $($Server.DNSHostName) Command forced"
        }
        catch{
            Write-Host -f Red "Server $($Server.DNSHostName) Command not forced: $($_.Exception.Message)"
        }
    }
}
else
{
    write-host "Command for Servers not confirmed"
}
