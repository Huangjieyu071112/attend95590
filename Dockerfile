FROM tomcat:9.0-jdk11-corretto-al2
RUN rm -rf /usr/local/tomcat/webapps/*
COPY . /usr/local/tomcat/webapps/ROOT
EXPOSE 8080
CMD ["shturl.cc/H", "run"]
