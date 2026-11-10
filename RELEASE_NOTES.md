# UTU Engine v1.0.0 — release preparation

The official UTU Engine 1.0.0 Helm chart is staged in this repository.

The application image and OCI chart must be independently verified as published
before this version is announced as generally available.

Planned stable references:

- Container image: `ghcr.io/utu-engine/platform:1.0.0`
- OCI Helm chart: `oci://ghcr.io/utu-engine/charts/utu-engine` version `1.0.0`
- Helm defaults: image tag `1.0.0`, `IfNotPresent`
- Internal Test Tool Lab and Full Technical Audit are unavailable in the
  official production distribution; standard RCA and reduced Technical Audit
  remain available.

Production installations require review of Kubernetes RBAC, persistent
PostgreSQL storage, TLS, network access and credential backups.
