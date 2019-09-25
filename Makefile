APPNAME = peizhi
# REGISTRY = 192.168.0.202:5000
VERSION = $(shell sed '/^  <version>/!d;s/.*>\([^<]*\)<.*/\1/' pom.xml)
TAG = $(shell git describe --tags --always --dirty="-dev")
IMAGE = $(if $(REGISTRY),$(REGISTRY)/)$(APPNAME)$(if $(TAG),:$(TAG))
MVN = mvn
JARFILE = target/$(APPNAME)-$(VERSION).jar

FLAG = -Dorg.slf4j.simpleLogger.defaultLogLevel=WARN

all: clean run


tag:
	git tag v$(VERSION)

run:
	$(MVN) spring-boot:run

clean:
	$(MVN) $(FLAG) clean

test:
	$(MVN) $(FLAG) test

package: clean
	$(MVN) $(FLAG) package

package2: clean
	$(MVN) $(FLAG) -Dmaven.test.skip=true package

doc:
	$(MVN) $(FLAG) javadoc:javadoc


copy:
	[ -f $(JARFILE) ] && cp $(JARFILE) assets/app.jar

build: package copy
	docker build -t $(IMAGE) .

push: build
	[ "$(REGISTRY)" != "" ] && docker tag $(IMAGE) $(REGISTRY)/$(IMAGE) && \
	docker push $(REGISTRY)/$(IMAGE) && docker rmi $(REGISTRY)/$(IMAGE)


# codetta: start
# sed '/^[0-9A-Za-z]*:/!d;s/:.*$//' Makefile | sort | tr '\n' ' ' | xargs -I {} printf ".PHONY:\n\t{}\n"
# codetta: output
.PHONY:
	all build clean copy doc package package2 push run tag test
# codetta: end
