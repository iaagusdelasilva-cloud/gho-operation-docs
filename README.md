# 📝 GHO Operation Docs

> **Repositorio de alta frecuencia** — Documentos crudos, logs operativos y fuente de ingesta para el CKC.

## 📂 Estructura

| Directorio | Propósito |
|------------|-----------|
| `inbox/` | Inputs crudos diarios de TODOS los pods |
| `logs/` | Logs operativos |
| `sprints/` | Resúmenes de sprint |
| `docs/` | Documentos generados por la org (ADRs, postmortems, estrategia, templates, WoW) |
| `processed/` | Archivos de inbox/ ya ingestados por CKC (cola de idempotencia) |
| `legacy_migration/` | Contenido migrado desde la vieja gho-knowledge-base |

## 🔄 Flujo

Los pods depositan sus outputs operativos acá. El **CKC (Chief Knowledge Context)** ejecuta batch sync periódico, destila el contenido en passages atómicos, y abre un **Pull Request** contra [gho-knowledge-base](https://github.com/gho/gho-knowledge-base) para aprobación humana.

## 📦 Legacy Migration

El directorio `legacy_migration/` contiene contenido migrado desde la versión anterior de la knowledge-base:
- `pods/` — Definiciones de pods v1 (SOUL, BRAIN, IDENTITY, etc.)
- `scripts/` — Scripts operativos originales
- `domain-knowledge/` — Passages y blueprints por dominio (pre-curación)
- `memory/` — Sprint history
- `src/` — Código Python del CKC
- `github-workflows/` — Workflows de CI/CD
