docker run \
  --name amoy-nginx \
  -d -p 80:80 \
  -v /workspace/nginx/conf/nginx.conf:/etc/nginx/nginx.conf \
  -v /workspace/nginx/conf.d:/etc/nginx/conf.d \
  -v /workspace/nginx/logs:/var/log/nginx nginx