#/bin/bash
# an interactive script to check the current rocketpool smartnode client version and update if necessary. This is intended to be run by a user and monitored for success
# i.e. don't run this as a cron job :)
# superphiz 2022-10-06 with some hints from faisalm.eth and 0xPatches
# https://discord.com/channels/405159462932971535/468923220607762485/1018285352756187136

AVAILABLE=$(curl --silent "https://api.github.com/repos/rocket-pool/smartnode-install/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/' | sed -E 's/v//')

INSTALLED=$(~/bin/rocketpool s v | grep 'Rocket Pool client version:' | awk -F ': ' '{print $2}')

echo 'The most recent version of the smartnode client is is'  "$AVAILABLE" 'and your installed version is' "$INSTALLED"


if [ $AVAILABLE == $INSTALLED ]
then
	echo "These look like the same version, i don't think you need an update right now."
else
	echo "Cool! There's a new version. I'm going to update now."

	sleep 2

	wget https://github.com/rocket-pool/smartnode-install/releases/latest/download/rocketpool-cli-linux-amd64 -O ~/bin/rocketpool

	rocketpool service stop -y

	sleep 2

	rocketpool service install -d -y

	rocketpool service start -y

	rocketpool service version

fi

echo "I won't do it for you, but please run \`rocketpool service logs\` and watch it for a few minutes to make sure everything is working."
