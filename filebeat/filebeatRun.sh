docker run --restart=always --log-driver json-file --log-opt \
 max-size=100m --log-opt max-file=2  \
 --name filebeat --user=root -d  \
 -v /var/lib/docker/containers/:/logs/ \
 -v /workspace/filebeat/filebeat.docker.yml:/usr/share/filebeat/filebeat.yml \
 -v /workspace/nginx/logs/:/logs/nginx/ \
 -v /workspace/amoy-dev3.1/mycat/logs/:/logs/mycat/ \
 store/elastic/filebeat:7.6.2

# -v /var/lib/docker/containers/ddfd5f7248af24254ed5cee531f66bb55a0db9fd2d0be581eb0af5e2b47550ae/*.log:/logs/  -v /var/lib/docker/containers/3aaec761731e40a6056468e0d59a9a6c460b6dacd3a08af9e31e3994a6a6c137/*.log:/logs/  -v /var/lib/docker/containers/3aaec761731e40a6056468e0d59a9a6c460b6dacd3a08af9e31e3994a6a6c137/*.log:/logs/