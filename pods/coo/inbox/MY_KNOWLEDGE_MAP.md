# MY_KNOWLEDGE_MAP: COO (Operational Excellence)

Este mapa filtra el conocimiento vital para la ejecución y escalabilidad operativa.

## Pasajes Relevantes
- **ID:** gho-adr-002-go-choice (Ref: Simplicidad de mantenimiento)
  - **Dominio:** it-architecture
  - **Contexto:** Factores que facilitan la operación y mantenimiento a largo plazo.

## Comandos de Auto-Actualización
Para ver nuevos pasajes operativos:
```bash
jq -r 'select(.domain | contains("ops", "process", "execution")) | .content' /home/agus/.openclaw/knowledge-base/passages.jsonl
```
