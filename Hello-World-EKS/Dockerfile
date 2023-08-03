FROM tomcat:9-jdk11-openjdk-slim
COPY */*.war /usr/local/tomcat/webapps/app.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
