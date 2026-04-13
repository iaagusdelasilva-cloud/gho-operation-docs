# Review Comment Template (Lean Feedback Protocol)

Este template es obligatorio para todos los comentarios en Pull Requests, siguiendo el **Lean Feedback Protocol** de GHO.

---

## Estructura Obligatoria

Todo review comment debe usar la siguiente estructura:

```markdown
[FINDINGS]
- <Hallazgo 1: dato concreto, observación específica>
- <Hallazgo 2: referencia a línea/archivo/métrica>

[ACTION ITEMS]
- [ ] <Acción concreta> - @responsable (deadline opcional)
- [ ] <Acción concreta> - @responsable
```

---

## Reglas

1. **Siempre empezar con `[FINDINGS]` o `[ACTION ITEMS]`** (o ambos)
2. **Cero introducciones** - No usar "Hola", "Buen trabajo", "Me parece que"
3. **Datos sobre opiniones** - Referenciar líneas, archivos, métricas concretas
4. **Acciones asignadas** - Cada action item debe tener un @responsable claro

---

## Ejemplos

### ✅ Correcto (Aprobación)

```markdown
[FINDINGS]
- ADR sigue formato 000-template-adr-finops.md correctamente.
- Triangulación incluye perspectivas Académica y Pragmática.
- Métricas de ROI validadas con fuentes externas.

[ACTION ITEMS]
- [x] Merge aprobado - @ceo (Sprint Demo 2026-04-08)
```

### ✅ Correcto (Cambios Requeridos)

```markdown
[FINDINGS]
- Línea 45: Hardcoded API key en `pods/cfo/src/config.py`.
- Sección 3.2: Falta triangulación (solo perspectiva Académica).
- ADR no referencia evidencia empírica (paso 2 del método científico).

[ACTION ITEMS]
- [ ] Mover API key a variable de entorno - @cto
- [ ] Agregar perspectiva Pragmática en Sección 3.2 - @cso
- [ ] Incluir fuentes de investigación en Referencias - @cfo
```

### ✅ Correcto (Pregunta/Clarificación)

```markdown
[FINDINGS]
- Línea 23: `timeout=300` no está justificado en el ADR.

[ACTION ITEMS]
- [ ] Explicar criterio para timeout de 300s vs 60s/600s - @cto
```

### ❌ Incorrecto (Violación del Protocolo)

```markdown
Hola @cto, espero que estés bien! 👋

Estuve revisando tu PR y me parece que está buenísimo, pero tengo algunas 
dudas. Quizás podrías explicarme por qué elegiste ese timeout? No estoy 
seguro si es el mejor valor.

También vi que hay una API key hardcodeada, tendrías que moverla.

Gracias!
```

---

## Checklist Pre-Envío

Antes de postear un review comment, verificar:

- [ ] Comienza con `[FINDINGS]` y/o `[ACTION ITEMS]`
- [ ] No incluye saludos, cortesías o relleno
- [ ] Cada hallazgo es específico y referenciable
- [ ] Cada action item tiene un @responsable asignado
- [ ] Lenguaje directo y de alta densidad informativa

---

**Nota:** Los reviews que no sigan este protocolo serán rechazados por el CoS Pod.
