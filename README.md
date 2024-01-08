# launchpad-app

This script will help you to create an Apple application that will be presented inside your `Launchpad`. This script could be calling any other command that you may have in your system.

In the example below, let's create an application that will call the application `terminator`, a `Gnome` terminal that was installed via `brew` and didn't add any entry on `Launchpad` by default.

- First, you can clone the repo or just the script.
```
% wget https://raw.githubusercontent.com/waldirio/launchpad-app/main/launchpad-app.sh
```
- Then you can execute the script `./launchpad-app.sh`
```
% ./launchpad-app.sh
```
- Enter with the application name
```
Type the name of your app: terminator
```
- Enter with the application path
```
Type the path of your binary/script you would like to call: /opt/homebrew/bin/terminator
```
- Enter with the folder path that you would like to create your application. If you just press enter, your home directory will be used
```
Type the path to create your app. By default, it will be in your home directory [/Users/wpinheir]:
```

At this moment, the structure will be created and your application will be ready to be installed. The output similar to below is expected
```
% ./launchpad-app.sh 
Type the name of your app: terminator
Type the path of your binary/script you would like to call: /opt/homebrew/bin/terminator
Type the path to create your app. By default, it will be in your home directory [/Users/wpinheir]: 
Using the home directory - /Users/wpinheir
/Users/wpinheir/terminator.app
/Users/wpinheir/terminator.app/Contents
/Users/wpinheir/terminator.app/Contents/MacOS
```

Also, this should be the folder tree
```
% tree terminator.app 
terminator.app
└── Contents
    ├── Info.plist
    └── MacOS
        └── terminator

3 directories, 2 files
```

After that, you could open your `Finder`, pick the folder, drag and drop over your Applications. This will install your new script, and after that, you should be good to move on, clicking on your `Launchpad` and clicking over your `terminator` application.

Please, let me know if you have additional questions or concerns.
<br>Waldirio