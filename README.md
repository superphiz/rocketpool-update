# rocketpool-update
a simple updater for rocketpool until joe integrates it natively. This tool will check the most recent version against your installed version, and update your current version if necessary.

**NOTE:** This script downloads the amd64 client, it will mess your stuff up if you're running this on a raspberry pi.

# How to:

0. Don't run this on a raspberry pi.
1. Read the code, attempt to understand it, convince yourself that it's not doing so something naughty.
2. On your Rocket Pool node, run `wget https://raw.githubusercontent.com/superphiz/rocketpool-update/master/update.sh`, this will download the script.
3. Run `chmod +x update.sh`, this will make it executable.
4. Run `./update.sh`, this will run the script and see if you need to update.
