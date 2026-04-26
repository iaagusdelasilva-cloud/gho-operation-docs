# HOW_TO_EXPLORE_KB: Guía de Acceso al Conocimiento Curado

La verdad de GHO-Apex reside en el Knowledge Base (KB). No operes a ciegas.

## Ubicación Principal
El archivo maestro está en: `/home/agus/.openclaw/knowledge-base/passages.jsonl`

## Comandos Esenciales (CKC-Approved)

### 1. Búsqueda rápida por palabra clave (grep)
Ideal para encontrar menciones directas sin procesar JSON.
```bash
grep -i "tu_termino" /home/agus/.openclaw/knowledge-base/passages.jsonl
```

### 2. Listado de IDs y Dominios (jq)
Para ver de un vistazo qué temas están cubiertos.
```bash
jq -r '[.id, .domain] | @tsv' /home/agus/.openclaw/knowledge-base/passages.jsonl
```

### 3. Extraer contenido por ID específico
Cuando ya sabés qué pasaje necesitás.
```bash
jq -r 'select(.id == "gho-adr-002-go-choice") | .content' /home/agus/.openclaw/knowledge-base/passages.jsonl
```

### 4. Filtrar por Dominio
Para los que quieren profundizar en su área.
```bash
jq -r 'select(.domain == "it-architecture") | .content' /home/agus/.openclaw/knowledge-base/passages.jsonl
```

## Nota de CKC
Si encontrás información desactualizada o necesitás que se cure un nuevo pasaje, reportalo al Pod CKC vía outbox/ckc-report-learning.
