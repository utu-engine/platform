# UTU Engine — Third-Party Software Notices

UTU Engine is proprietary software governed by its [End User License Agreement](LICENSE). It uses or can be deployed alongside third-party software subject to separate licenses. The UTU Engine EULA does **not** supersede those licenses or remove rights granted by their licensors.

This document provides an **initial, source-verified public inventory** of identified dependencies as of 13 November 2026. It is not an exhaustive Software Bill of Materials (SBOM), a complete inventory of transitive dependencies, or a substitute for mandatory full license texts, attribution notices, source offers, or other license-specific distribution obligations. The exact components in a published release must be verified against that release's images and artifacts.

## Identified third-party components

| Component | Use in UTU Engine | Identified version | License | Official source / license |
| --- | --- | --- | --- | --- |
| PostgreSQL Community Server | Optional separate database container deployed by the UTU Helm chart | `postgres:18.6` in current Helm defaults | PostgreSQL License | [PostgreSQL license](https://www.postgresql.org/about/licence/) |
| Psycopg 3 | Python PostgreSQL driver in the application image | 3.3.6 in the production dependency input | LGPL-3.0-only | [Psycopg](https://github.com/psycopg/psycopg) · [LGPL license](https://github.com/psycopg/psycopg/blob/master/LICENSE.txt) |
| PostgreSQL libpq | PostgreSQL client library installed through the operating-system package `libpq5` | OS-package version determined by the built image | PostgreSQL License | [PostgreSQL license](https://www.postgresql.org/about/licence/) |
| Drain3 | Log-template mining in the investigation application | 0.9.11 in the production dependency input | MIT | [Drain3](https://github.com/logpai/Drain3) · [package metadata](https://pypi.org/project/drain3/) |
| VictoriaMetrics MetricsQL parser | Go module compiled into the application's metrics-query parsing helper | `github.com/VictoriaMetrics/metricsql` v0.87.4 in the source Go module | Apache-2.0 | [MetricsQL source](https://github.com/VictoriaMetrics/metricsql) · [license](https://github.com/VictoriaMetrics/metricsql/blob/master/LICENSE) |

The PostgreSQL server is a **separate image**, not a library relicensed under UTU Engine. Its use depends on deployment configuration. Its official license includes, among other notices:

- Portions Copyright © 1996–2026, The PostgreSQL Global Development Group.
- Portions Copyright © 1994, The Regents of the University of California.

Psycopg is licensed under LGPL-3.0-only. The distributor must preserve its notices and comply with the applicable LGPL obligations, including the rights relating to modification/replacement of that component where required. The LGPL-3.0 text incorporates GPL-3.0 terms. Merely naming or linking the licenses in this document is not sufficient to establish LGPL compliance.

## Additional dependencies and container components

The application build configuration currently uses an Ubuntu 26.04 base image, Python 3.14, and OS packages including OpenSSH client, CA certificates and DejaVu fonts. These components carry their **own** package-specific licenses. Python runtime dependencies, their transitive dependencies, Go build dependencies and OS packages must be inventoried from the **final release artifacts**. A package's presence in a source manifest does not prove that it is included in every published build.

For transparency, the main application production dependency lock is generated separately from the publicly distributed Helm chart. This public repository contains deployment and release materials, **not** the proprietary application source. This document intentionally does not claim to enumerate all contents of an as-yet-unverified public production image.

## Release-specific distribution requirements

Before each public image/chart release, the distributor should:

1. Generate and review a complete SBOM and package/license inventory from the exact published application image, optional accompanying images and chart artifacts; include direct and transitive dependencies.
2. Preserve required copyright statements, notices, complete license texts and any applicable source/relinking information; in particular, review the LGPL-3.0 obligations for Psycopg.
3. Include applicable notices and license texts **with the distributed artifacts** where required; a hyperlink in this public document is not automatically a substitute.
4. Review unknown, dual-licensed, copyleft or incompatible components and update this inventory when the actual shipped dependency set changes.

For notices pertaining to dependencies that customers install or configure independently (such as an external monitoring service or customer-selected LLM provider), consult the corresponding supplier's terms. Use of an external service does not mean its server software is redistributed by UTU Engine.

## Ownership and contact

All third-party components remain the property of their respective copyright holders and contributors. Their inclusion does not imply endorsement of UTU Engine.

For a correction to this inventory or a third-party licensing question, contact **support@utu-engine.com**.
