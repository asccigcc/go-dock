# Go-Dock

Go-Dock is a Dockerfile that helps to use go easly in your computer. With the power of Make and Docker we create a Docker container with Go installed and access to your local development environment.

Docker is initialized allowing to mount the development path where your project is saved and providing a clean environment to develop and test your application.

# How to use

## Create access token

First of all create a Github access token [here](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token). This token will provide access to privates repositories as you which.

After the creation you can add as part of your environment variables:

```
# .bashrc or .zshrc
GITHUB_ACCESS_TOKEN=[YOUR TOKEN]
```
## Download go-dock

Download this repository using `curl` inside your Go project.

```
curl -OL https://raw.githubusercontent.com/asccigcc/go-dock/master/dockerfiles/Dockerfile
curl -OL https://raw.githubusercontent.com/asccigcc/go-dock/master/Makefile
```

This will download all indi
## Configure the docker

Edit Makefile adding your project information:

```
NAME=[PROJECT NAME] 
SRC=[SOURCE PATH]
TAG=[PROJECT PATH]
```

Example:

```
NAME=go-dock 
SRC=github.com # represents path: /go/src/github.com
TAG=asccigcc/go-dock # represents path: /go/src/github.com/asccigcc/go-dock
```
## Run you docker

Now you are ready to start your container with Go and your application. 

### Build the container
Makefile has a build command that prepare the container:

```
make docker-build
```
### Shell

This command allow you to access into a shell with access to your project

```
make shell
```

## Test

This command run your Go test

```
make test
```