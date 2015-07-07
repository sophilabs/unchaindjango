VERSION=$(shell grep __version__ unchaindjango/__init__.py)
REQUIREMENTS="requirements-dev.pip"
TAG="\n\n\033[0;32m\#\#\# "
END=" \#\#\# \033[0m\n"

all: test

msg-init:
	@echo $(TAG)Initializing messages from Unchain Django$(END)
	pybabel init -D unchaindjango -i unchaindjango/locale/unchaindjango.pot -d unchaindjango/locale -l en
	pybabel init -D unchaindjango -i unchaindjango/locale/unchaindjango.pot -d unchaindjango/locale -l es
	@echo

msg-extract:
	@echo $(TAG)Extracting messages from Unchain Django$(END)
	pybabel extract -o unchaindjango/locale/unchaindjango.pot unchaindjango
	pybabel update -D unchaindjango -i unchaindjango/locale/unchaindjango.pot -d unchaindjango/locale -l en
	pybabel update -D unchaindjango -i unchaindjango/locale/unchaindjango.pot -d unchaindjango/locale -l es
	@echo

msg-compile:
	@echo $(TAG)Compiling messages to Unchain Django$(END)
	pybabel compile -D unchaindjango -d unchaindjango/locale -f --statistics
	@echo

msg: msg-compile msg-extract

uninstall-unchaindjango:
	@echo $(TAG)Removing existing installation of Unchain Django$(END)
	- pip uninstall --yes unchaindjango >/dev/null
	@echo

uninstall-all: uninstall-unchaindjango
	- pip uninstall --yes -r $(REQUIREMENTS)

init: uninstall-unchaindjango
	@echo $(TAG)Installing dev requirements$(END)
	pip install --upgrade -r $(REQUIREMENTS)
	@echo $(TAG)Installing Unchain Django$(END)
	pip install --upgrade --editable .
	@echo

test: init
	@echo $(TAG)Running tests in on current Python with coverage $(END)
	py.test --cov ./unchaindjango --cov ./tests --doctest-modules --verbose ./unchaindjango ./tests
	@echo

test-tox: init
	@echo $(TAG)Running tests on all Pythons via Tox$(END)
	tox
	@echo

test-dist: test-sdist test-bdist-wheel
	@echo

test-sdist: clean uninstall-unchaindjango
	@echo $(TAG)Testing sdist build an installation$(END)
	python setup.py sdist
	pip install --force-reinstall --upgrade dist/*.gz
	@echo

test-bdist-wheel: clean uninstall-unchaindjango
	@echo $(TAG)Testing wheel build an installation$(END)
	python setup.py bdist_wheel
	pip install --force-reinstall --upgrade dist/*.whl
	@echo

# This tests everything, even this Makefile.
test-all: uninstall-all clean init test test-tox test-dist

publish: test-all
	@echo $(TAG)Testing wheel build an installation$(END)
	@echo "$(VERSION)"
	@echo "$(VERSION)" | grep -q "dev"  && echo "!!!Not publishing dev version!!!" && exit 1
	python setup.py register
	python setup.py sdist upload
	python setup.py bdist_wheel upload
	@echo

clean:
	@echo $(TAG)Cleaning up$(END)
	rm -rf .tox *.egg dist build .coverage
	find . -name '__pycache__' -delete -print -o -name '*.pyc' -delete -print
	@echo
