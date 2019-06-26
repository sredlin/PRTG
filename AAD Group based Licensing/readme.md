Paessler PRTG Sensor to check AAD Group Licensing


This sensor count all users in a AAD Group and check if the user have licensing errors.

The channels are  the following for each group.

Groupname - TotalUserCount      : number of users in the group<br>
Groupname - LicensedUserClount  : number of users with a licence<br>
Groupname - LicenseErrorCount   : number of users with a licensing error<br>

MSOnline module is required.

To pass Username and Password the parameter section of the sensor could be used.<br>
-O365User %linuxuser -O365pass %linuxpassword

<a href="https://ibb.co/CKFP8QC"><img src="https://i.ibb.co/4Rx1tpv/gbl.png" alt="gbl" border="0"></a>
