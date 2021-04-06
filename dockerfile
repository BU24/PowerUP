FROM openjdk:8-jdk
# ARG JAVA_OPTS 
# ENV JAVA_OPTS=$JAVA_OPTS 
EXPOSE 8443 
COPY apache-ofbiz-17.12.06 /ofbiz 
WORKDIR /ofbiz
RUN ./gradle/init-gradle-wrapper.sh 
RUN ./gradlew cleanAll loadAll 
CMD ./gradlew ofbiz  
# For Spring-Boot project, use the entrypoint below to reduce Tomcat startup time. 
#ENTRYPOINT exec java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar ofbiz.jar 
 