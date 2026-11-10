# UTU Engine v1.0.0

First versioned production release of the UTU Engine application-centric
incident investigation platform.

- Official multi-architecture image: `ghcr.io/utu-engine/platform:1.0.0`.
- Alias `ghcr.io/utu-engine/platform:latest` tracks the newest stable version.
- Helm OCI chart: `oci://ghcr.io/utu-engine/charts/utu-engine`, version `1.0.0`.
- Default Helm image is pinned to `1.0.0`; pull policy is `IfNotPresent`.
- Tool Testing Lab and internal Full Technical Audit are disabled inside the
  production image and cannot be enabled with Helm values or environment
  variables. Standard RCA and redacted Technical Audit remain available.
- Includes optional PostgreSQL 18 database, persistent volume and automated
  bootstrap secret creation.

Check namespace RBAC, database backups, HTTPS ingress, NetworkPolicy and
external LLM/observability access before installing. The source code remains
proprietary and is not included in this repository.
