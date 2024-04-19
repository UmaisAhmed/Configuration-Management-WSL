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


**Configuration Management Plan**
=========
1.	**Introduction**
The configuration Management Plant outlines the procedures and processes for managing the configuration of the Snapshot imaging app throughout its development lifecycle. This plan ensures the integrity, traceability, and control of software components, configuration, and changes.

2.	**Software Configuration Management [SCM]** 
2.1	**Definition of SCM**
Software configuration management [SCM] encompasses the management of software configuration to ensure consistency, reliability, and maintainability throughout the development process. 
2.2	 **Major Activities of SCM**
1.	Software Configuration Identification: Identifying and defining software configuration items [SCIs] to be controlled. 
2.	Software configuration control: Managing changes to software configurations through established change control processes. 
3.	Software configuration status Accounting: Recording and reporting the status of software configuration throughout the development lifecycle. 
4.	Software Configuration Audits: Conducting audits to verify compliance with configuration management processes and standards. 
2.3	**Supporting Processes**
1.	SCM Standards: Adhering to industry standards and best practices for configuration management. 
2.	Management of SCM Functions: Ensuring effective management and coordination of SCM activities. 
3.	SCM Planning: Developing plans and schedules for configuration management activities. 




3.	**Configuration Management Planning** 
3.1	**Purpose of Introduction:** 
The purpose of this section is to provide an overview of the Configuration Management Plan and its objectives. 
3.2	**SCM Management** 
Outline the responsibilities and roles of individuals involved in SCM activities. 
3.3	**SCM  Activities** 	
	Configuration Identification
Identifying software configuration items, defining characteristics, and establishing baselines. 
	Configuration Control
Implementing change control processes to manage changes to configurations.  
	Configuration Status Accounting
Recording and reporting the status of configurations. 
	Configuration Audits&Reviews
Conducting audits to ensure compliance and effectiveness of configuration management processes. 
	Interface Control 
Managing interfaces between different software components. 
	Subcontractor/Vendor control 
Ensuring Configuration management processes are applied to subcontracted or vendor-supplied components. 

3.4	**SCM Schedules** 
Developing schedules for configuration management activities aligned with the development plan milestones. 
3.5	**SCM Resources and Tools**
Identifying resources, tools, and infrastructures required to support configuration management activities. 


4.	**Configuration Identification**
4.1	**Identifying Software Configuration Items [SCIs]**
Identifying components, data, and product acquisition to be controlled as configuration items.
The Software Bill of Materials [SBOM] provides a comprehensive list of Software components used in the Snapshot imaging app, including 
o	Components Name 
o	Version
o	Category (Cloud-NA, Development Only, Fielded)
o	Software Manufacturing Country
o	End of Manufacturer Support Date

**Client-side Components**:
1.	**Graphical User Interface Component:**
Blend for Visual Studio 2022: A tool used for designing XAML-based WPF apps, providing a visual interface for various control elements and windows within the DV-Imaging software system.
2.	**Presentation Logic Component:** 
Presentation logic defines the logical behavior and structure of the application, independent of any specific user interface implementation. It includes ViewModel classes corresponding to specific windows created in the graphical user interface layer.
3.	**Patient Data Management Component:**
Provides basic functions for storing, retrieving, querying, and editing patient information.
4.	**Image Management Component:**
Responsible for displaying images, managing raw MSI images, and color reference images for specific subjects and wounds. The DeepView file system manages these images, with a logical connection between subject data and images maintained in a database. 
5.	**System Resources controller:**
Manages system processes, threads, working memory, and device storage, including the collection and release of these resources.
6.	**System Monitor:**
Responsible for monitoring DV-Imaging software system resources and DV-COM hardware component operation status. Logs events and errors in specific log files and selectively displays them in the GUI.
7.	**Data Function Collection:** 
Utilizes Object-Relational Mapping (ORM) for the .NET platform to create the Data Access Layer (DAL). Dapper is used as the DAL component for data storage and access with MySQL database, providing features such as speedy performance, support for static/dynamic object binding, easy handling of SQL queries, multiple query support, and support for stored procedures. 
 

**Server-side Components**
1.	**Image Acquisition Components:**
Controls Image acquisition, and activates illumination systems such as MSI cameras, color cameras, and LED lights for acquiring raw images for specific wound locations. Also responsible for the color reference image processing and MSI image processing for Pseudocolor image generation. 
2.	**Image Processing Component:**
Provides functions for editing Pseudocolor and color reference images by adjusting their brightness. Utilizes optical algorithms for distortion correction, cropping, downsampling, image I/O, format changes, and other image optimization tasks. 
3.	**Camera Resource controller:**
Integrates DV-Imaging color cameras SDK and C# Managed Middleware wrapper for controlling the DV-COM MSI imaging head. Manages the integration of SDK related to DV-COM MSI imaging head components, including MSI cameras, MSI LED board, focus and framing board, distance sensors, gyroscope, and light sensors. 


4.2	**Defining Important Characteristics**
Defining characteristics of each configuration item and identifying owners for accountability. 
For each software components identified in the SBOM, key characteristics such as version, category, manufacturing country, and end-of-support date will be defined and documented. 
4.3	**Establishing Baselines**
Establishing and controlling baselines to ensure stability and traceability of configurations. 
Baselines will be established for software configurations based on the information provided in the SBOM. Each baseline will include the specific versions of software components required for a particular stage of development or release. 
4.4	**Maintaining Revision Relationships**
Maintaining document and component revision relationships to track product versions.
Document and component revision relationships will be maintained to track product versions and ensure traceability throughout the development lifecycle. Changes to software components will be documented and linked to the corresponding revisions in the SBOM.  

5.	**Configuration Identification Methods**
Utilizing configuration control boards and established processes for effective configuration identification. 



6.	**Configuration Status Accounting** 
Recording and reporting the status of software configurations throughout the development lifecycle. 

7.	**Configuration Audits.** 
Conducting audits to verify compliance with configuration management processes and standards. 

8.	**Product Release and Distribution** 
Managing the release and distribution of software products following established configuration management processes. 

9.	**Software Development Plan [ Snapshot Imaging App Development Plan]**
1.	**Software Life Cycle:** The software development process encompasses various stages, including planning, requirements analysis, design, implementation, testing, and release. Configuration management activities will be integrated into each stage of the software life cycle to ensure consistency and control of software configurations. 
2.	**Update Software Development Plan:**  The configuration Management Plan will be updated as necessary to reflect changes in the Software Development Plan will be updated as necessary to reflect changes in the Software Development Plan, ensuring ongoing alignment between configuration management and development activities. 
3.	**Reference to System Design and Development:** The configuration Management Plan will reference system design and development documents to ensure that configuration management activities support the objectives and requirements outlined in these documents. 
4.	**Software Verification Plan:** Configuration Management activities will align with the software verification plan to ensure that software configurations are verified and validated according to specified requirements and quality standards. 
5.	**Software Risk Management Plan:** Configuration management activities will be integrated with the Software Risk Management Plan to identify, assess, and mitigate risks associated with software configuration throughout the development processes.
6.	**Problem Resolution:** Configuration management processes will support problem resolution activities by providing mechanisms for tracking and managing software configuration issues and defects. 
7.	**Software Maintenance Plan:**  Configuration management activities will be integrated with the Software Maintenance Plan to ensure that changes and updates to software configuration are managed effectively over time. 
8.	**Development Processes:**  Configuration management processes will be aligned with the software development processes outlined in the Software Development Plan to ensure consistency and coordination between configuration management and development activities. 
9.	**Sofware Requirements Analysis, User Interface Design, Architectural & Detailed Design, Unit Implementation & Testing, Verification Testing, Release, and Maintenance:** Configuration management activities will be integrated into each stage of the software development process to ensure that software configurations are managed effectively from requirements analysis through maintenance.

