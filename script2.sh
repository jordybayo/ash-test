# command to retrieve all instances with core dumped in the log file
sed -u -n -e "s/^.*cdsmon: //p" /tmp/dev.log | awk -F ' ; ' '{ print $1 }'
