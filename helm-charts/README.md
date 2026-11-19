# Five-microservice Helm chart

The chart is a reusable single-service chart. Install one release per microservice
using its corresponding values file.

Templates include Deployment, HPA, PodDisruptionBudget, Service, Ingress,
GKE BackendConfig, ServiceAccount, Istio VirtualService and helpers.

Note: the supplied `pdb.yaml` snippet was an HPA specification, not a PDB.
That HPA spec is implemented in `hpa.yaml`; `pdb.yaml` is a real policy/v1 PDB.

Example:
```bash
helm upgrade --install service-user ./helm-charts \
  -f ./helm-charts/dev-values/service-user.yaml
```

Repeat for service-auth, service-admin, service-upi and service-use. Review
service-specific endpoints, image tags, registry secret, ingress hosts and
cluster-specific annotations before deployment. Validate with `helm lint`
and `helm template` first.
