Paessler PRTG Senors to check if there are any unprotected OU's.

Add this script to C:\Program Files (x86)\PRTG Network Monitor\Custom Sensors\EXEXML and create a EXE/Script Advanced Sensor.

This script need the ActiveDirectory Powershell module.

If any unprotected OU's are detected the script create a Logfile under "C:\Logs\Maintenance\unprotectedOU.csv".
The sensor will inform you about this.

<a href="https://ibb.co/GFQzmqK"><img src="https://i.ibb.co/x3qxZNp/ou.png" alt="ou" border="0"></a>
