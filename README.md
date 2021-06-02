

# Configurations for deployment.

> Steps of deploying necessary environment for the Amoy Interest (Spring Boot Backend+mysql+mycat+elk)

- Environment: Ubuntu20.04-64.bit 2cores 16 GB

- Preparation

  - transfer files to the server

    ```shell
    scp -r ./deployment root@{server.ip}:./workspace
    ```

  - Install docker and docker-compose

    ```shell
    apt-get update
    apt-get install docker
    apt-get install docker-compose
    ```

- Deploy the elk (7.62)

  - Set the virtual memory for the docker

    Linux:

    ```
    sudo vim /etc/sysctl.conf
    vm.max_map_count=262144
    sysctl -w vm.max_map_count=262144
    ```

    Windows: [link](https://stackoverflow.com/questions/42111566/elasticsearch-in-windows-docker-image-vm-max-map-count) 

  - Just follow the [Reference link]( https://www.cnblogs.com/woshimrf/p/docker-es7.html) , but you could use the modified image by the follwing command, more details about the configuration files will be updated......(maybe)

    ```
    docker build  -t my_elasticsearch ./
    ```

- Deploy the backend

  - Use Maven to construct .jar package

    ```shell
    maven clean package
    ```

  - Find the .jar under the target directory and move it to the same directory of the docker-compose.yml

  - Docker-compose down and delete the image of the backend 

    ```shell
    docker compose down
    docker image rm {name of the backend image}
    ```

  - Docker-compose up

    ```shell
    docker compose up -d
    ```

  - NOTE: If you have modify something related to the init of the mysql, you need to delete the volume also

    ```shell
    docker volume rm {the volumes}
    ```

  

  