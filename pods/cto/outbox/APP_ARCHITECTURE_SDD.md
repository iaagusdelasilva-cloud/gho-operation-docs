# System Design Document (SDD): GHO-Apex Core Engine

**Version:** 2.0.0  
**Status:** Approved / Apex-Sync Official Standard  
**Architect:** CTO Pod (Apex-Sync)  
**Paradigm:** Package Oriented Architecture (Go-Idiomatic High-Performance)

## 1. Visión de Arquitectura
El motor de GHO-Apex evoluciona hacia una **Package Oriented Architecture (POA)**. Abandonamos las abstracciones pesadas (Clean/Hexagonal) en favor de la localidad de datos, la simplicidad y el rendimiento bruto. El sistema se construye como un conjunto de paquetes cohesivos que priorizan la intención sobre la capa.

## 2. Core Design Principles
*   **Mechanical Sympathy:** Diseño alineado con el funcionamiento del hardware (L1/L2 cache, branch prediction).
*   **Zero-Allocation (Hot Path):** Minimizar la instanciación de objetos en el loop de ejecución principal para reducir la presión del Garbage Collector.
*   **Package Oriented:** El software se organiza por lo que proporciona, no por lo que es (e.g., `package risk` en lugar de `package services`).
*   **Performance First:** Descartamos Clean Architecture y Hexagonal por la sobrecarga de interfaces innecesarias y el "indirection overhead" que atenta contra la latencia ultra-baja.

## 3. Estándar de Estructura de Directorios
Seguimos el estándar de layout de Go para garantizar consistencia y localidad:

```text
/
├── cmd/                # Puntos de entrada (binarios). Cada subcarpeta es un ejecutable.
│   └── gho-engine/     # Main entry point del motor de arbitraje.
├── internal/           # Lógica privada del proyecto. No importable por terceros.
│   ├── platform/       # Código fundacional (db, logger, config).
│   ├── arbitrage/      # Core logic de arbitraje.
│   ├── risk/           # Motor de riesgo en tiempo real.
│   └── settlement/     # Liquidación y ejecución de órdenes.
├── pkg/                # Librerías compartidas diseñadas para ser importadas por otros.
│   └── types/          # Tipos de datos primitivos y constantes globales.
├── api/                # Definiciones de contratos (Protobuf, Flatbuffers).
└── docs/               # Documentación técnica y especificaciones.
```

## 4. Justificación del Modelo POA vs Clean/Hexagonal
GHO-Apex rechaza Clean/Hexagonal Architecture basándose en los siguientes pilares técnicos:

1.  **Performance (Indirection Cost):** Las capas de abstracción excesivas (interfaces para todo) añaden overhead de vtable lookups y dificultan el inlining del compilador, aumentando la latencia en el hot path.
2.  **Localidad de Datos:** POA fomenta que los datos y la lógica que los opera estén cerca. En sistemas de trading, el layout de memoria es crítico para evitar cache misses.
3.  **Estilo Go Idiomático:** La complejidad de "ports and adapters" suele resultar en archivos repetitivos (`boilerplate`) y una navegación de código tortuosa que no escala en velocidad de desarrollo (Startup Spirit).
4.  **Menor Acoplamiento Cognitivo:** En lugar de saltar entre 5 capas para entender un trade, POA permite ver la lógica de dominio en paquetes autocontenidos y claros.

## 5. Plano de Ejecución y Comunicación
*   **API Layer:** Uso mandatorio de **Flatbuffers** o **Protobuf (Binary)** en el directorio `/api` para serialización ultra-rápida.
*   **Internal Core:** Implementación de pipelines de datos orientados a paquetes, evitando el uso de interfaces globales a menos que sea estrictamente necesario para la inyección de dependencias en tests.

---
*GHO-Apex: Low Latency or Death.*
