.PHONY: test bins clean
PROJECT_ROOT = github.com/im-adarsh/cadence101

export PATH := $(GOPATH)/bin:$(PATH)

# default target
default: test

PROGS = helloworld \
	branch \
	childworkflow \
	choice \
	dynamic \
	greetings \
	pickfirst \
	retryactivity \
	splitmerge \
	timer \
	localactivity \
	query \
	consistentquery \
	cron \
	tracing \
	dsl \
	fileprocessing \
	dummy \
	expense \
	recovery \
	cancelactivity \
	ctxpropagation \
	pso \
	pageflow \
	signalcounter \

TEST_ARG ?= -race -v -timeout 5m
BUILD := ./build
SAMPLES_DIR=./workflow

export PATH := $(GOPATH)/bin:$(PATH)

# Automatically gather all srcs
ALL_SRC := $(shell find ./common -name "*.go")

# all directories with *_test.go files in them
TEST_DIRS=./workflow/cron \
	./workflow/expense \

cron:
	go build -i -o bin/cron workflow/cron/*.go

dummy:
	go build -i -o bin/dummy workflow/expense/server/*.go

expense:
	go build -i -o bin/expense workflow/expense/*.go

bins: cron \
	dummy \
	expense \

test: bins
	@rm -f test
	@rm -f test.log
	@echo $(TEST_DIRS)
	@for dir in $(TEST_DIRS); do \
		go test -coverprofile=$@ "$$dir" | tee -a test.log; \
	done;

clean:
	rm -rf bin
	rm -Rf $(BUILD)
