APPNAME = peizhi
FLAG = "-Dorg.slf4j.simpleLogger.defaultLogLevel=WARN"
REGISTRY = $(shell echo $REGISTRY)
TAG = $(shell git describe --tags)
MVN = mvn

all: clean run

clean:
	$(MVN) $(FLAG) "clean"

run:
	$(MVN) $(FLAG) "spring-boot:run"

package: clean
	$(MVN) $(FLAG) "package"

package2: clean
	$(MVN) $(FLAG) "-Dmaven.test.skip=true" "package"

doc:
	$(MVN) $(FLAG) "javadoc:javadoc"

copy:
	[ -f target/${APPNAME}-*.jar ] && cp target/${APPNAME}-*.jar assets/app.jar

build: package copy
	docker build -t $(REGISTRY)/$(APPNAME):$(TAG) .

push: build
	docker push $(REGISTRY)/$(APPNAME):$(TAG)


.PHONY: clean run package package2 doc copy build push
