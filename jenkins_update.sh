#!/bin/bash
# Author: Ramazan YETIS

if (($# == 1)); then
        CONTAINER_ID=$(docker ps | grep "jenkins" | awk '{print $1}')

        docker exec -itu root $CONTAINER_ID mv /usr/share/jenkins/jenkins.war /usr/share/jenkins/jenkins.war.old

        docker exec -itu root $CONTAINER_ID wget https://updates.jenkins.io/download/war/$1/jenkins.war -O /usr/share/jenkins/jenkins.war

        docker exec -itu root $CONTAINER_ID rm -f /usr/share/jenkins/jenkins.war.old

        docker restart $CONTAINER_ID

        echo "[*] Jenkins has updated to version $1"
else
        echo "[!] Usage of script:"
        echo "     $0 <version_of_jenkins>"
fi
