# Dynamic DNS Updater for Digital Ocean using API version 2.


## Purpose

Bash script which dynamically updates an 'A' record on Digital Oceans domain server. This script is useful in case of a sticky IP. This script uses Digital Ocean's version 2 API.

## Usage

Before we proceed, make sure ``python'' is installed.

1. Download and Open the ``updater.sh`` and set the following parameters:
    ```
    TOKEN=""
    RECORD_ID=""
    DOMAIN_NAME=""
    ```
2. In the terminal set the following permissions ``chmod 700 updater.sh`` to be able to execute the script.
3. Add this script to cron, if you want to run periodically. See the section on Cron.

### Cron

To have this script running periodically you must add this script to your crontab. To list all the current crontab jobs do ``crontab -l`` and to edit the crontab jobs write ``crontab -e`` in your terminal. 

For example, the command for running this script every 2 hours:

``` 
* */2 * * * path_to_updater/updater.sh
```


## See also 
- [Digital Ocean API v2 - Update a domain record](https://developers.digitalocean.com/#update-a-domain-record)
- [Ben Squire's repository](https://github.com/bensquire/Digital-Ocean-Dynamic-DNS-Updater) for a similar script written in Python.

