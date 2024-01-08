#!/bin/bash

#  
# License ....: GPL 
# Developer ..: Waldirio M Pinheiro <waldirio@gmail.com>
# Date .......: Jan/08/2024
# Purpose ....: To create an apple application in a way that will be presented in launchpad
# 

collect_info()
{
  # To collect the app name
  echo -n "Type the name of your app: "
  read app_name

  # To collect the app path (binary that will be executed)
  echo -n "Type the path of your binary/script you would like to call: "
  read app_path

  if [ ! -f $app_path ]; then
    echo "file not found, please, try again!"
    echo "exiting ..."
    exit 1
  fi

  # To collect the app folder that will be created
  echo -n "Type the path to create your app. By default, it will be in your home directory [${HOME}]: "
  read app_destination

  if [ "$app_destination" == "" ]; then
    echo "Using the home directory - $HOME"
    app_destination=$HOME
  else
    echo "Using the directory - $app_destination"
  fi

# Here we are calling a second function, passing all the parameters
create_app "$app_name" "$app_path" "$app_destination"
}

create_app()
{
  # Parsing all the parameters
  app_name=$1
  app_path=$2
  app_destination=$3

  # Creating the folder structure
  mkdir -pv ${app_destination}/${app_name}.app/Contents/MacOS

  # Creating the script that will be called
  cat << EOF > ${app_destination}/${app_name}.app/Contents/MacOS/$app_name
#!/bin/bash
${app_path}&
EOF

  # Setting the correct permission (executable)
  chmod +x ${app_destination}/${app_name}.app/Contents/MacOS/$app_name
  
  # Creating the Info.plist (this is the one that will force the entry to be presented on launchpad)
  cat << EOF > ${app_destination}/${app_name}.app/Contents/Info.plist
<?xml version="1.0" encoding="UTF-8" standalone="no"?><plist version="1.0">
  <dict>
    <key>CFBundleExecutable</key>
    <string>${app_name}</string>
</dict>
</plist>
EOF
}

collect_info
