## Summary of the Issue:

* Duration: Start time: 19/01/24 10:00 PM (WAT), End time: 19/01/24 11:30 PM (WAT).
* Total Downtime: 1 Hour, 30 minutes.
* Issue Description: WordPress page returned a 500 status code, rendering it inaccessible for all users.
* Root Cause: Typo in a WordPress configuration document.
* Users Affected: 100%

## Timeline:

* 06/03/23 10:01 PM (WAT): Issue detected by users; reported to customer care.
* 06/03/23 10:15 PM (WAT): Issue communicated to System Engineering team and SRE.
* 06/03/23 10:17 PM (WAT): Checked running processes with 'ps auxf' - no unwanted child processes found.
* 06/03/23 10:23 PM (WAT): Used 'strace' on apache2 processes; identified infinite loop in one process.
* 06/03/23 10:50 PM (WAT): Discovered file access errors in 'strace'; found typo in file extension in wp-settings.php.
* 06/03/23 11:06 PM (WAT): Corrected typo, removed extra 'p' from file extension.
* 06/03/23 11:30 PM (WAT): Restarted apache2 with 'service apache2 restart'; page resumed normal operation.

## Root Cause and Resolution:

* One typo in wp-settings.php caused apache2 malfunction.
* Issue resolved by correcting the typo and restarting apache2.
* No escalation to other areas.

## Corrective and Preventative Measures:

* Set write permissions on setting files (/var/www/html/wp-settings.php) only for SRE to prevent injection of such typos.

## TODO:

* Change permissions on /var/www/html/wp-settings.php to read-only for the team.
* Review all setting files for similar typos.

# Image (For advanced Task)
https://images.app.goo.gl/8SSnfSMgVAZWSoru9
