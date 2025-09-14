Kubernetes Commands
- Get Version: 
  kubectl version

- Create/update resource/pod: 
  kubectl apply -f platforms-depl.yaml

- List/inspect resource deployments: 
  kubectl get deployments

- List/inspect pods: 
  kubectl get pods
  kubectl get services 
  kubectl describe  pods 
  kubectl describe services
  kubectl describe  service <service-name>

- Delete Existing Deployment and Pod and re-apply deployment(if image tag was not changed): 
  kubectl delete deployment <deployment-name>
  kubectl delete pod <pod-name>
  kubectl apply -f deployment.yaml

- If you're using the same image tag (e.g., latest) and just want to force Kubernetes to pull the new image:
  kubectl rollout restart deployment <deployment-name>


