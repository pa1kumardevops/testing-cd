# ArgoCD + Argo Rollouts Blue-Green Sample

This repo contains:
- core-service (Spring Boot + gRPC)
- messaging-service (Spring Boot + gRPC)
- Helm charts for both services
- Argo Rollouts manifests for blue-green deployments

## Quick Start
1. Build & push images to AWS ECR (update `values.yaml` with your repo URLs)
2. Add repo to ArgoCD
3. Sync & test blue-green rollout
