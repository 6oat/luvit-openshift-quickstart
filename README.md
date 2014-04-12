# OpenShift QuickStart for Luvit

Luvit is an attempt to do something crazy by taking node.js architecture and dependencies and seeing how it fits in the Lua language.

## Status

This project is still under heavy development, but it's showing promise. Initial benchmarking with a hello world server is between 2 and 4 times faster than node.js. Version 0.6.0 is the latest release version.

## Installation

Create OpenShift application

	rhc app create -a $name -t diy-0.1

and enter the directory

	cd $name

Add this repository as new remote

	git remote add upstream -m master git://github.com/openshift-quickstart/luvit-openshift-quickstart.git

and pull locally

	git pull -s recursive -X theirs upstream master

finally, deploy to OpenShift

	git push origin master

Now, your application is available at

	http://$name-$namespace.rhcloud.com

## Configuration

Luvit version is configurable in .openshift/action_hooks/start
