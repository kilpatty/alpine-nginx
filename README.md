# Non-Root Nginx Docker Image Running On Alpine Linux.

This is a Nginx server Docker build that is optimized for a one-client per container set up. This image is built on top of Alpine-Linx to reduce its image size. Additionally, Nginx is run as non-root for the most security.

## Usage

The default server for this image listens on port 8080 inside of the container. If using a php-fpm image, the default server also looks for that image on port 9000.

This image is installed as an automated build on DockerHub. In order to run this image open port 8080, and then point it to this image.

    docker run -p 80:8080 --name nginx skilgarriff/alpine_linux

If you are running this image for development, it is recommended to pull the image tagged dev from DockerHub. See the note on SendFile for the reason why.

    docker run -p 80:8080 --name nginx skilgarriff/alpine_linux:dev

## Notes

### SendFile
It is a [documented issue](https://www.virtualbox.org/ticket/9069) that setting sendfile to on in the nginx.conf will break on machines using VirtualBox to run docker (boot2docker, docker-machine, etc). Thus, the latest version of this image will not work specifically for development purposes. Pull the version of this image tagged "dev" to use in development. The only change is sendfile is turned off.


## License

The code is available under the [MIT License](/LICENSE).
