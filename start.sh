#!/bin/bash
echo "Starting SSH..."
service ssh start

if [ -f /home/site/wwwroot/package.json ]; then
	echo "Run npm install in /home/site/wwwroot..."
    cd /home/site/wwwroot
    npm install
else
	echo "No package.json found in /home/site/wwwroot"
fi

echo "Starting Function Host..."
dotnet "/azure-functions-host/Microsoft.Azure.WebJobs.Script.WebHost.dll"
