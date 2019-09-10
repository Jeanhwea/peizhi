APP_NAME = peizhi
JAVA_EXEC  = java
MAVEN_EXEC = mvn
MAVEN_FLAG = "-Dorg.slf4j.simpleLogger.defaultLogLevel=WARN"
DOCKER_REG = 192.168.0.202:5000
DOCKER_TAG = $(shell date +'%Y%m%d')

all: clean run

clean:
	$(MAVEN_EXEC) $(MAVEN_FLAG) "clean"

run:
	$(MAVEN_EXEC) $(MAVEN_FLAG) "spring-boot:run"

package: clean
	$(MAVEN_EXEC) $(MAVEN_FLAG) "package"

package2: clean
	$(MAVEN_EXEC) $(MAVEN_FLAG) "-Dmaven.test.skip=true" "package"

doc:
	$(MAVEN_EXEC) $(MAVEN_FLAG) "javadoc:javadoc"

build: package
	[ -f target/${APP_NAME}-*.jar ] && \
	mv target/${APP_NAME}-*.jar assets/app.jar && \
	docker build -t $(DOCKER_REG)/$(APP_NAME):$(DOCKER_TAG) .

push: build
	docker push $(DOCKER_REG)/$(APP_NAME):$(DOCKER_TAG)


.PHONY: clean run package package2 doc deploy
