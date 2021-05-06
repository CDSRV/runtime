# RUNTIME
- runtime toolkit

## PURPOSE
- configure a shell environment
- setup or validate runtime toolkits
- developer productivity & convenience

## GOALS
- reusable solutions to common problems
- modular design for simple expansion & concise version control
- idempotent results in shell and file system

## QUICK-START

	bash # tested on linux only
	git clone https://github.com/CDSRV/runtime.git
	cd runtime
	# source the setup for the current shell
	. ./bin/setup/bash 
	# source or run setup for other frameworks
	#
	# use the 'workspace' function to define the current directory as $WORKSPACE
	workspace
	# use the 'status' function to output important details of the current environment
	status

## REFERENCES
- https://unix.stackexchange.com/questions/30925/in-bash-when-to-alias-when-to-script-and-when-to-write-a-function
- https://stevebennett.me/2012/02/24/10-things-i-hate-about-git/

