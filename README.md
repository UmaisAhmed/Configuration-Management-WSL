Automated creation of WSL 2 Development
===

The WSL Tooling repository provides a PowerShell script to effortlessly set up a fully functional WSL 2 development environment. The installation process has been completely revamped and updated for seamless setup once your Windows system supports WSL 2 instances.


## Preparation
To use this repository, first copy it to your computer.

### Enable Windows Subsystem for Linux
***If you've never activated WSL on your Windows before, follow these steps:*** 

Open a powershell with **administrative** privileges and execute this script to enable WSL and VM platform on your machine.
You might need to change security settings because the scripts aren't digitally signed. (see first commnd below) because the Powershell scripts are not digitally signed (https:/go.microsoft.com/fwlink/?LinkID=135170):
```powershell
# Optional: Set Security to Bypass
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
# Enable WSL
.\enableWSL.ps1
```
This will take a couple of minutes. If it was not enabled before, you need to reboot Windows.

A restart is required if any of the two above features have not been installed before.

### Set WSL default version to 2

Set the default WSL version to 2. Open a powershell with administrative privileges:
```powershell
.\installWSL2.ps1
```

## Distribution Installation

### Download and Install Ubuntu LTS (20.04)
If not already done, open a new powershell with administrative privileges and install Ubuntu LTS. You **need** to provide four arguments. If you don't specify them on command line, then the script will ask:
- `<wslName>`: Provide a name for the WSL that is goind to be created (e.g. `ubuntu2004`)
- `<wslInstallationPath>`: The directory where the vhdx disk of the new WSL is stored
- `<username>`: the name of the user that is used when WSL distro is launched without `-u`
- `<installAllSoftware>`: Use `true`|`false`. Tell if all software packages (see [Available Software](#Available-Software)) shall be installed or if `false` only a fully updated system with configured user is supplied
For example, the command can look as follows:
```powershell
.\installUbuntuLTS.ps1 ubuntu2004-devbox D:\WSL2\devbox umais true
```

### Available Software Package
If don't want to install all packages during initial WSL creation, you can install them one buy one. They are available here [./scripts](./scripts).
- Ubuntu Base Package (git, virt-manager, firefox, dbus-x11, x11-apps, make, unzip) ([scripts/install/installBasePackages.sh](./scripts/install/installBasePackages.sh))
- docker & compose V2 ([scripts/install/installDocker.sh](./scripts/install/installDocker.sh))
