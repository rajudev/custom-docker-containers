# Instructions for spawning your own container. 

1. `cd` into the folder you want to build the container for. 
2. Specify the base image you want to build the container from in the `Dockerfile`
3. Put your changes that you want to do in `setup.sh`
4. build the container with `docker build -t <name-that-you-want-for-container>:tag .` 
	e.g. `docker build -t ubuntu-xenial-kurento:latest`
5. Once the image builds you should see it in the list of downloaded docker images with `docker images`
6. Sharing your image with Docker registery
	6.1 Log in with your Docker ID `docker login`
	6.2 Tag the image with following syntax `docker tag image username/repository:tag` e.g. `docker tag ubuntu-xenial-kurento rajudev/ubuntu-xenial-kurento:latest`
	6.3 Run `docker images` to see your newly tagged image.
	6.4 Upload your tagged image to the repository: syntax `docker push username/repository:tag` e.g. `docker push rajudev/ubuntu-xenial-kurento:latest`

7. Next time just use your own container as usual `docker pull <your-username>/<your-container-name>`
	e.g. `docker pull rajudev/ubuntu-xenial-kurento:latest`

