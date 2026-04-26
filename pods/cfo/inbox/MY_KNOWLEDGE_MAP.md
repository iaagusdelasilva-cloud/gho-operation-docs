# MY_KNOWLEDGE_MAP: CFO (Economic & Risk Guard)

Este mapa filtra el conocimiento vital para la eficiencia de recursos y gestión de riesgo.

## Pasajes Relevantes
- **ID:** gho-adr-002-go-choice (Ref: Eficiencia de recursos / FinOps)
  - **Dominio:** it-architecture
  - **Contexto:** Menciones sobre eficiencia de recursos inherente al stack.

## Comandos de Auto-Actualización
Para ver nuevos pasajes de finanzas o riesgo:
```bash
jq -r 'select(.domain | contains("finance", "finops", "risk")) | .content' /home/agus/.openclaw/knowledge-base/passages.jsonl
```
