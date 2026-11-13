# UTU Engine

Official distribution repository for **UTU Engine**, an application-centric
incident investigation platform.

This repository provides the Helm chart, installation instructions and versioned
release information. It does not host the UTU Engine application source code.

## Official links

- **Website:** [utu-engine.com](https://utu-engine.com/)
- **Documentation:** [docs.utu-engine.com](https://docs.utu-engine.com/)

## Release status

The `1.0.0` Helm chart is available in the repository under
[`helm/utu-engine`](helm/utu-engine). A public production image and OCI Helm
release are **not yet confirmed published**. Check
[Releases](https://github.com/utu-engine/platform/releases) before using
the registry commands below.

| Artifact | Planned stable reference |
| --- | --- |
| Docker image | `ghcr.io/utu-engine/platform:1.0.0` |
| Latest stable alias | `ghcr.io/utu-engine/platform:latest` |
| Helm OCI chart | `oci://ghcr.io/utu-engine/charts/utu-engine` |
| Helm chart version | `1.0.0` |

## Helm chart source

The source chart can be inspected in `helm/utu-engine`. With Helm 3:

```bash
git clone https://github.com/utu-engine/platform.git
cd platform
helm lint helm/utu-engine
helm template utu-engine helm/utu-engine --namespace utu-engine
```

After the official production image and OCI chart are available, the intended
installation command is:

```bash
helm upgrade --install utu-engine oci://ghcr.io/utu-engine/charts/utu-engine \
  --version 1.0.0 --namespace utu-engine --create-namespace
```

The chart is configured for `ghcr.io/utu-engine/platform:1.0.0` with
`IfNotPresent`, not a floating `main` or `latest` image.

## Security and operation

The official production distribution is designed to exclude the internal Test
Tool Lab and Full Technical Audit from user-configurable options. The standard
RCA report and redacted Technical Audit are retained.

The Helm chart uses Kubernetes Secrets for credentials and may deploy a
PostgreSQL 18 StatefulSet with persistent storage. Preserve Secrets and PVCs
across upgrades. Review RBAC, ingress TLS, egress and backups before production
installation. This chart does not automatically migrate existing Helm releases
with different names.

## Release policy

Production versions are published as deliberately selected, verified SemVer
releases, not on every change to development. Version tags must not be silently
overwritten.

## License

UTU Engine is proprietary. The current End User License Agreement is **EULA Version 1.0**: see [LICENSE](LICENSE). Third-party components retain their respective licenses;
see [THIRD-PARTY-NOTICES.md](THIRD-PARTY-NOTICES.md) for the initial public
inventory and third-party attribution information.
