sudo docker run -d --net host -e PGID=0 -e PUID=0 --restart always --privileged --name proxy2 tarmets/test2

sudo docker exec -it proxy2 /bin/bash
