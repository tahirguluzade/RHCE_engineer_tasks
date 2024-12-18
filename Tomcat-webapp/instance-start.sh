#!/bin/bash
instance_name=$1
TOMCAT_BASE=/home/tomcat8/tomcat
INSTANCE_BASE=$TOMCAT_BASE/instances
CATALINA_HOME=$TOMCAT_BASE/tomcat-9
CATALINA_BASE=$INSTANCE_BASE/$instance_name
export CATALINA_BASE CATALINA_HOME
$CATALINA_HOME/bin/startup.sh



# this script creates appropriate variables everytime when startup.sh runs
# usage:
#         ./instance.sh  <instance name>