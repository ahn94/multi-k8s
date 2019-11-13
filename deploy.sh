docker build -t austnig94/multi-client:latest -t austnig94/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t austnig94/multi-server:latest -t austnig94/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t austnig94/multi-worker:latest -t austnig94/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push austnig94/multi-client:latest
docker push austnig94/multi-client:$SHA

docker push austnig94/multi-server:latest
docker push austnig94/multi-server:$SHA

docker push austnig94/multi-worker:latest
docker push austnig94/multi-worker:$SHA

kubectl apply -f k8s

kubectl rollout restart deployment/server-deployment:latest
kubectl rollout restart deployment/client-deployment:latest
kubectl rollout restart deployment/worker-deployment:latest