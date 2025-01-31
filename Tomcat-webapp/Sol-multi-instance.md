## Running web application in two Tomcat multi-instances
##### 1. Multi-instances are services which are running like isolated from each other.If one of them fails, it does not affect to other instances.
- In order to run applications as multi-instances we need to create separate directories.

```
mkdir /home/tomcat9/tomcat/instances
cp /home/tomcat9/tomcat/apache-tomcat-9.0.98  /tomcat/instances/instance1
cp /home/tomcat9/tomcat/apache-tomcat-9.0.98  /tomcat/instances/instance2
```
So, now we have `instances/instance1` and `instances/instance2` directories where we will deploy two different web apps.Each directory has own default `bin` , `work` , `conf` , `lib`.
- we need to change port configurations for every instance in `conf/server.xml` file.
    - Don't forget to add ports to firewalld 

To start and stop even to see status of instances we need to create `unit` file for each instance.

-  `/etc/systemd/system/tomcat-instance1.service`
- `/etc/systemd/system/tomcat-instance1.service`

```
systemctl enable --now tomcat-instance1.service
systemctl enable --now tomcat-instance1.service
```
If Selinux is on enforcing mode then you need to change file , otherwise `systemd` couldn't start services..
```
semanage fcontext -a -t tomcat_var_run_t '<instance path>(/.*)?'
semanage fcontext -a -t tomcat_exec_t '<catalina home directory>/bin(/.*)?'

restorecon -Rv <catalina home directory>/bin
restorecon -Rv <instance path>

```

Now, let's check our web applications on browser:
## Instance1 web app
<img src="images/webapp.png">

## Instance2 web app
<img src="images/instance2.png">

## Method  (I did it on another VM )
### Let's run instances with `instance-start.sh` file rather that unit file

```
mkdir /home/tomcat8/tomcat/controller
cd controller
# add instance-start.sh to this folder

./instance-start.sh instance1
./instance-start.sh instance2
```
Instance 1 started with `instance-start.sh`
<img src="images/instance1-sh.png">

Instance 2 started with `instance-start.sh`
<img src="images/instance2-sh.png">
