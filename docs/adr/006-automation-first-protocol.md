## 🛠️ Automation-First Protocol (GHO-Guard)
- **Regla de la 2da Ejecución:** Toda tarea crítica ejecutada 2 veces manualmente debe automatizarse en la 3ra con un script en `/scripts/` o una skill.
- **Investigación:** Para automatizar, el Pod debe usar `web_search` o `engram` para buscar el "Estado del Arte", priorizando economía de tokens.
- **Auditoría:** Todo script/skill nuevo requiere un bloque `<finops_analysis>` (Tokens vs Ahorro de tiempo).
- **Inyección:** Los scripts obligatorios se inyectan en el `spawn-contract.md` de cada Pod mediante `## 🛠️ Initialization Hooks`.
