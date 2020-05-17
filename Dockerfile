FROM gradle:jdk8

COPY wordhugopress/ /opt/wordhugopress/
WORKDIR /opt/wordhugopress/

RUN ./gradlew clean build

CMD ["bash"]
#ENTRYPOINT [ "sh", "./gradlew" ]
#CMD [ "clean", "build", "run" ]