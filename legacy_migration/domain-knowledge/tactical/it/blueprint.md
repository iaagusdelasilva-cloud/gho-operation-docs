# GHO BRAIN.md (Tactical Domain Map)
Este es el mapa táctico de GHO para el equipo de IT y Estrategia.

## 🏛️ Core Dominios (Technical)
- **Ledger & Arbitrage Graph:** El estado de la verdad in-memory.
- **Rule Engine:** La lógica de decisión estratégica.

## 🔄 Flujos de Valor
- **Market Data -> Ledger:** Ingesta de alta frecuencia.
- **Ledger -> Rule Engine -> Execution:** El ciclo de arbitraje determinista.

---
# GHO Architecture Notes
- **Patrón:** Event Sourcing para la resiliencia del Ledger.
- **Patrón:** Saga Pattern para la atomicidad de la ejecución.
- **Patrón:** Modular Monolith para baja latencia in-memory.
