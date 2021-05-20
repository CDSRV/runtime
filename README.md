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
- decouple intent from complex syntax
- less typing, more functionality

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

## FEATURE SUMMARY
### common idioms of version control systems
#### - extensible for use with any VCS
#### - set default options
#### - actions based on context
##### bin/$ACTION
- add: wrapper over $VCS.add - stage files for commit
- branch: : creates new, or switches as needed
	- .[delete|empty|list] : easy
- clean: removes ALL untracked, including ignored
- clone: bulk clone from list of repos into workspace catalog
- commit: wrapper over $VCS.commit - update repo
- dif: wrapper over $VCS.diff - shows changes
- log: wrapper over $VCS.log - shows history
- pull: wrapper over $VCS.pull - update from remote
- push: wrapper over $VCS.push - update to remote
- remove: wrapper over $VCS.rm - remove from filesystem AND cache 
- rev : output current revision hash value
- revert: wrapper over $VCS.revert - hard reset repo
- status: 
	- output relevant environment variables
	- wrapper over $VCS.status 

### streamline container development
- docker.[build|login|rm|run]
	- generate dockerfile using project & workspace context
	- modular option specification
	- bind mount workspace as workdir, read-only or read-write

### time-data field generation
- today: sort-friendly ISO-8601 date ( YYYY-MM-DD )
- now: Hour-Minute-Second

### basic secret generation
- apg.[binary|strong|uppoercase] : using https://linux.die.net/man/1/apg
- entropy: using dd, defaults set for creating LUKS token

### storage utilization metrics
- df.[shm|tmp|xfs]: returns free space metric values ONLY

### utilize common frameworks
##### bin/setup/$FRAMEWORK
- runtime/install: updates .bashrc - optional
- bash:
	- checks for compatible shell 
	- loads all functions, aliases and workspace defined environment variables into the current shell
- c: basic gcc requirements
- git: basic git requirements
- git-repo: vs https://source.android.com/setup/develop#installing-repo
- golang:  
	-	supply any version as $1
	- installs into $WORKSPACE
	- defines GO variables		
- helm:
	- fixed from upstream to not require sudo or nosudo option
- python:
	- uses apt or yum package manager 
	- supply major version as $1
	- complete pip setup for both PY2 and PY3
	- defines PY variables
- spack: from https://spack.io/
	- installs into $WORKSPACE

## DEFINES:
### WORKSPACE
- root context for all other operations

### PROJECT
- basename of repo

### VERSION
- branch and revision

### NAME
- concatenated project, branch and version details

## REFERENCES
- https://unix.stackexchange.com/questions/30925/in-bash-when-to-alias-when-to-script-and-when-to-write-a-function
- https://stevebennett.me/2012/02/24/10-things-i-hate-about-git/
- https://eklitzke.org/environment-variables
