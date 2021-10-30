docker pull ubuntu:latest   
docker run -d -i -t -v /home/adesu/geodjangomapapp:/media/workplace:Z -p 8080:8000 --name geodjango ubuntu:latest


# latest: Pulling from library/ubuntu
# 7b1a6ab2e44d: Pull complete 
# Digest: sha256:626ffe58f6e7566e00254b638eb7e0f3b11d4da9675088f4781a50ae288f3322
# Status: Downloaded newer image for ubuntu:latest
# docker.io/library/ubuntu:latest
# 430ab240de669b094241d29ca10f408fa455926b8f7b15f8d45d7ea20cedcef8


sudo docker image ls
# REPOSITORY    TAG       IMAGE ID       CREATED       SIZE
# ubuntu        latest    ba6acccedd29   2 weeks ago   72.8MB



sudo docker exec -i -t geodjango bash

