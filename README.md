# UTU Engine · Platform

The official production distribution of **UTU Engine**, an application-centric
incident investigation platform. This repository contains public Helm charts,
versioned releases and installation documentation; proprietary application
source code and development workflows remain private.

## Production release: v1.0.0

| Artifact | Location |
| --- | --- |
| Docker image | `ghcr.io/utu-engine/platform:1.0.0` |
| Latest stable image alias | `ghcr.io/utu-engine/platform:latest` |
| Helm OCI chart | `oci://ghcr.io/utu-engine/charts/utu-engine` (version `1.0.0`) |
| Chart source | `helm/utu-engine` |
| Release archives | [GitHub Releases](https://github.com/utu-engine/platform/releases) |

### Install

Requires Helm 3.8+, Kubernetes, working PersistentVolume provisioning, and
network access to the container registry and your observability/LLM systems.

```bash
helm install utu-engine oci://ghcr.io/utu-engine/charts/utu-engine \
  --version 1.0.0 --namespace utu-engine --create-namespace
```

### Download the chart

```bash
helm pull oci://ghcr.io/utu-engine/charts/utu-engine --version 1.0.0 --untar
```

Or clone this repository and install the chart source:

```bash
helm upgrade --install utu-engine ./helm/utu-engine \
  --namespace utu-engine --create-namespace
```

### Pull the application image

```bash
docker pull ghcr.io/utu-engine/platform:1.0.0
docker pull ghcr.io/utu-engine/platform:latest
```

The Helm chart defaults to the immutable `1.0.0` tag and `IfNotPresent`.
The `latest` alias is published for convenience, not used by default by Helm.

### Internal capabilities

The official production image is compiled with an immutable production
capability lock. **Tool Testing Lab** and **Full Technical Audit** cannot
be enabled through Helm, environment variables, or the application's API.
The standard RCA report and redacted Technical Audit remain available.

These two internal settings do not appear in the public chart. Altering
the software or building a custom image is outside the official distribution.

### Deployment and data considerations

The chart runs one UTU Engine Backend and optionally creates a persistent
PostgreSQL 18 database. Bootstrap credentials and encryption keys are generated
as Kubernetes Secrets; preserve those secrets and the PostgreSQL PVC for
upgrade, restore, and recovery. Review the RBAC scope, network egress,
resource limits and HTTPS ingress configuration before external access.

This first production chart is **not** an in-place migration for a previous
`rca-agent` Helm installation; plan migration separately.

### Source development and release policy

Development in `eerkalin/rca-agent` does not publish here. A production
release requires a deliberate manual promotion of an independently tested
production-build candidate. Published SemVer tags are never overwritten.

### Licensing

UTU Engine is proprietary software. Refer to [LICENSE](LICENSE) and the
applicable written UTU Engine license agreement before use. Third-party
components remain under their respective licenses.
