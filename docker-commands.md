# Docker
<br>
## Delete
.
### Delete all running containers at once
docker ps -aq | xargs docker stop | xargs docker rm
.
### Delete all images at once
docker images -q | xargs docker rmi -f
.
### Delete all the networks at once
docker network ls -q | xargs docker network rm
.
.
# Java
.
## Delete
.
sudo rm -fr /Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin
sudo rm -fr /Library/PreferencesPanes/JavaControlPanel.prefPane
sudo rm -fr ~/Library/Application\ Support/Oracle/Java
.
