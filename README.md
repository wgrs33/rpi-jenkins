# Jenkins server dedicated to Raspberry Pi platform
Jenkins docker image for Raspberry Pi platform
- based on the newest version of Jenkins
- Java : OpenJDK-11-JRE

# Usage

```bash
docker run -p 8080:8080 -p 50000:50000 wgrs33/rpi-jenkins
```
This will store the workspace in */var/lib/jenkins*. All Jenkins config/data files will be there. 

To add external volume and have easy access to the files use :

```bash
docker run -d -p 8080:8080 -p 50000:50000 -v $(pwd)/jenkins_home:/var/lib/jenkins/ wgrs33/rpi-jenkins
```
this will automatically create a 'jenkins_home' volume on docker host, that will rest after container stop/restart/deletion.