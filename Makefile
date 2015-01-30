.PHONY: package lint test mocha mvn-test

default: package lint test

clean:
	mvn clean

package:
	mvn clean package

lint:
	node_modules/jshint/bin/jshint --verbose bin lib test

test: lint mvn-test mocha

mvn-test:
	mvn test

mocha:
	node_modules/mocha/bin/mocha --timeout 5s --reporter=spec --ui tdd
