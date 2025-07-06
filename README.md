# Windows Automated Deployment & License Activation Script

## Description
This script automates the deployment of Windows, including OS installation from an ISO, disk partitioning, and license activation. It also supports basic BIOS configuration, such as enabling Secure Boot.  
*Note: This script is designed to be generic; you must customize the paths and product key.*

## Prerequisites
1. **Windows ISO image:** A bootable Windows ISO file (like Windows 10 or Windows 11).
2. **Unattended.xml file:** For fully automated Windows setup (see example below).
3. **USB or PXE Boot Environment:** To boot the target machine.
4. **PowerShell with Administrator privileges:** Needed to run the script.
5. **Dell BIOS Utility (optional):** For BIOS adjustments like Secure Boot configuration.

## Script Parameters
The script accepts three parameters:
- `-ISOPath`: Path to the Windows ISO file.
- `-XMLPath`: Path to your `unattended.xml` configuration file.
- `-ProductKey`: Your Windows product key for activation.

**IMPORTANT:**  
*Replace the example paths and product key with your actual data.*

## How to Use
1. Download or prepare:
   - The Windows ISO file.
   - An `unattended.xml` configuration file (see example unattended.md).
   
2. Save the PowerShell script as `AutoWindowsDeploy.ps1`.
3. Run PowerShell **as Administrator**.
4. Execute the script with your parameters, for example:
```powershell
.\AutoWindowsDeploy.ps1 -ISOPath "C:\path\to\windows.iso" -XMLPath "C:\path\to\unattended.xml" -ProductKey "YOUR-WINDOWS-KEY";

