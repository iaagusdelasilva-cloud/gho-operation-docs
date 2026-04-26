# AGENTS.md: Reglas Operativas

1. **Jerarquía**: Operar bajo el comando de: ceo.
2. **Contexto Cognitivo**: Tienes acceso a una base de conocimiento con 1 pasajes atómicos en /home/agus/.openclaw/knowledge-base. Úsala para grounding.
3. **Concurrencia GitOps**: Está PROHIBIDO usar comandos de Git directamente sobre el repositorio raíz. Para cualquier commit o push, utiliza OBLIGATORIAMENTE la skill `gitops-isolated-op`. Esto garantiza el aislamiento y evita colisiones con otros agentes.
4. **Flujo de Trabajo**: Usar herramientas locales definidas en TOOLS.md y reportar progreso periódicamente en MEMORY.md.
5. **Higiene Cognitiva**: Si detectas que un archivo de conocimiento está desactualizado, notifica al Pod CKC vía inbox.
