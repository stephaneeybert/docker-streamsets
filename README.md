Installation

Pull the image
```
docker pull streamsets/datacollector
```

Watch some logs in terminals
```
watch docker stack ps --no-trunc streamsets
docker service logs -f streamsets_streamsets
tail -f volumes/logs/sdc.log
```

Create the project directory
```
mkdir -p ~/dev/docker/projects/streamsets;
```

Create the volume directories
```
chmod g+s ~/dev/docker/projects/streamsets/volumes;
mkdir -p ~/dev/docker/projects/streamsets/volumes/logs;
chmod 777 ~/dev/docker/projects/streamsets/volumes/logs;

docker volume create --name sdc-data;
```

Installing stage libs using the CLI or Package Manager UI requires a volume for the stage libs directory
```
docker volume create --name sdc-stagelibs;
mkdir -p ~/dev/docker/projects/streamsets/volumes/stage-libs-extra;
chmod -R 777 ~/dev/docker/projects/streamsets/volumes/stage-libs-extra;
```
The StreamSets container needs to be restarted to complete the installation of a stage library

Install the MySQL connector into the MySQL BinLog stage lib extra directory
  Log in the admin panel
  Click on the Package Manager icon
  At the bottom of the left pane, click on the External Libraries button
  On the top right of the page, click on the Install External Libraries icon
  In the dialog box, first select the stage library for which to install the connector
    Select the MySQL BinLog entry
  Browse to the connector jar file and upload it
A same jar file must be installed in each stage library that needs to use it
Repeat the operation for the JDBC stage lib extra directory

Add a hostname
In the /etc/hosts file add the entry:
127.0.1.1 dev.streamsets

View the application in the browser at
```
http://dev.streamsets:18630/
```

Check of the JDBC driver stage library is installed
```
docker-exec ...
cd /opt/streamsets-datacollector-3.18.1;
bin/streamsets stagelibs -list;
```

The admin console
```
http://dev.streamsets:18630
```
Use the following credentials:
Login: admin
Password: admin

Creating a pipeline
  Click on the Home icon
  Click on the Create New Pipeline button
  Enter a title for the pipeline and click on the Save button

Adding the MySQL Binary Log and JDBC Producer stage libraries to a pipeline
  Click on the Home icon
  Select an existing pipeline or create one
  In the pipeline view, in the right panel, select the Origins entry, type in mysql in the search field and select the MySQL Binary Log entry
  In the pipeline view, in the right panel, select the Destinations entry, type in jdbc in the search field and select the JDBC Producer entry

Viewing a change data capture
  Click on the Home icon
  Select an existing pipeline or create one
  Click on the Preview icon
  Do some data update in the MySQL database
  Watch the live preview of the data

Start the services
```  
cd ~/dev/docker/projects/streamsets
docker stack deploy --compose-file docker-compose-dev.yml streamsets
```

Stopping the common services
```  
docker stack rm streamsets
```
