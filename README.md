# digitalocean-dynamic-dns-updater


## Purpose

Dynamically updates an 'A' record on Digital Oceans domain server. 

## Usage

1. Open the script and set the following parameters:
    ```
    TOKEN=""
    RECORD_ID=""
    DOMAIN_NAME=""
    ```
2. Save the file and in the terminal you might need to do ``chmod 700 updater.sh`` to be able to execute the script.
3. Add this script to your crontab, if you want to run periodically. See the section on Cron.

### Cron

To have this script running periodically you must add this script to your crontab. To list all the current crontab jobs do ``crontab -l`` and to edit the crontab jobs write ``crontab -e`` in your terminal. 

For example, the command for running this script every 2 hours:

``` 
* */2 * * * path_to_updater/updater.sh
```


## See also 
- [Digital Ocean API v2 - Update a domain record](https://developers.digitalocean.com/#update-a-domain-record)
- [Ben Squire's repository](https://github.com/bensquire/Digital-Ocean-Dynamic-DNS-Updater) for a similar script written in Python.

