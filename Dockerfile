FROM tomcat:8.0.20-jre8

EXPOSE 8080

COPY ./SWE-645-HW1.war /usr/local/tomcat/webapps/