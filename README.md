### Usage: main.sh [OPTION]

ONLY edit the CONFIG file with your remote backup server to point the script to the correct target.
 
### Allowed OPTIONS:

**-h, --help**      Displays this help and exit

**-f, --full**      Runs a full (system config files, web and db, home dir) backup on your system

**-m, --man**       Run manual backups on desired files and applications

### Dependencies
If you're running a minimal version of your distro (CLI only) - you will need to install "pinentry" for the manual input of a passphrase to gpg encryption.

* CentOS - dnf install pinentry
