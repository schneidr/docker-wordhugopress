FROM gradle:jdk8

COPY wordhugopress/ /opt/wordhugopress/
WORKDIR /opt/wordhugopress/

RUN ./gradlew clean build

ENTRYPOINT [ "./gradlew" ]
CMD [ "run" ]
