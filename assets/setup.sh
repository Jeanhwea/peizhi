# Install startup script for container
[ ! -d /app/log ] && mkdir -p /app/log &&
  mv /asserts/app.jar /app &&
  mv /assets/startup.sh /usr/sbin/startup.sh &&
  chmod +x /usr/sbin/startup.sh

# remove installation files
rm -r /assets/
