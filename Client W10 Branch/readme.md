Paessler PRTG Senors to check which W10 branch is used in the domain.


This script could be used to count all W10 clients and monitor which branch is installed.

Add this script to C:\Program Files (x86)\PRTG Network Monitor\Custom Sensors\EXEXML and create a EXE/Script Advanced Sensor.

This script need the  ActiveDirectory Powershell module.

In the sensor settings add the searchbase as parameter "OU=PC,DC=domain,DC=tld".

<a href="https://ibb.co/0rMg7RQ"><img src="https://i.ibb.co/w4W9kFY/w10branch.png" alt="w10branch" border="0"></a>
