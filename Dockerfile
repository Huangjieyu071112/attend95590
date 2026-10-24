# Use the official Tomcat 9 image with Java 11
FROM tomcat:9.0-jdk11-corretto

# The default ROOT welcome webapp is kept: the platform health check on "/"
# returns HTTP 200. The deployed app itself lives under the /attendance context.
# (Removing ROOT/docs/examples/host-manager/manager is optional and was
# omitted here so the startup health check can pass.)

# Copy the war file into Tomcat's webapps folder
COPY attendance.war /usr/local/tomcat/webapps/attendance.war

# Use an entry point that adapts the port to the platform's PORT variable
COPY entrypoint.sh /usr/local/tomcat/bin/entrypoint.sh
RUN chmod +x /usr/local/tomcat/bin/entrypoint.sh

EXPOSE 8080
CMD ["/usr/local/tomcat/bin/entrypoint.sh"]