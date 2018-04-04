# WinRM-Commander

PowerShell Commander which can execute  commands from a central server on several Active Directory machines at the same time via WinRM.

So por example admins don't have to restart the monitoring client on each of the monitored servers manuall.

## Getting Started

These instructions will guide you through the setup of WinRM Commander on your local Server.

### Prerequisites

To use WinRM Commander you need to ensure that the following prerequisites are met:

* The Server running the WinRM Script needs to be in an Active Directory
* The User executing the script on the server needs to have Domain Administrator Privileges
* The target Server/Machines needs to have WinRM enabled on destination computers

### Installing

ToDo: @Kai-Herzig please add an intruction how to install all dependencies and the tool itself on server systems.

### Usage

Just execute the [WinRM-Commander.ps1](./source/WinRM-Commander.ps1) PowerShell script on a server which mets the recommandations above.

You will then guided through the Tool via wizard.

To add custom scripts or commands place them in the /source/scripts directory as .txt files.

See the same folder for examples.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details