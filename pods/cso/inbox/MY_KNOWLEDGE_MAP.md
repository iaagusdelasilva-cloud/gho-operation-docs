# MY_KNOWLEDGE_MAP: CSO (Shield & Compliance)

Este mapa filtra el conocimiento vital para la seguridad y el cumplimiento normativo.

## Pasajes Relevantes
- [PENDIENTE DE CURACIÓN EN KB]

## Comandos de Auto-Actualización
Para ver nuevos pasajes de seguridad:
```bash
jq -r 'select(.domain | contains("security", "compliance", "legal")) | .content' /home/agus/.openclaw/knowledge-base/passages.jsonl
```
