APPNAME = peizhi
# REGISTRY = 192.168.0.202:5000
TAG = $(shell git describe --tags)
IMAGE = $(if $(REGISTRY),$(REGISTRY)/)$(APPNAME)$(if $(TAG),:$(TAG))

MVN = mvn
FLAG = -Dorg.slf4j.simpleLogger.defaultLogLevel=WARN

all: clean run

clean:
	$(MVN) $(FLAG) clean

run:
	$(MVN) $(FLAG) spring-boot:run

package: clean
	$(MVN) $(FLAG) package

package2: clean
	$(MVN) $(FLAG) -Dmaven.test.skip=true package

doc:
	$(MVN) $(FLAG) javadoc:javadoc

copy:
	[ -f target/${APPNAME}-*.jar ] && cp target/${APPNAME}-*.jar assets/app.jar

build: package copy
	docker build -t $(IMAGE) .

push: build
	docker push $(IMAGE)


.PHONY: clean run package package2 doc copy build push
