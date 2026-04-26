# PRD V1: Multi-Asset Edition (GHO-Apex)

## 1. Visión General
Expandir las capacidades de arbitraje de la plataforma para permitir el uso de activos volátiles (BTC, ETH) como puentes de liquidez. El objetivo final sigue siendo la acumulación de Stablecoins, pero utilizando la volatilidad de los activos principales para encontrar rutas de mayor yield. GHO-Apex como organización centraliza estas operaciones multi-asset.

## 2. Estrategias de Arbitraje (Pod-Quant)
Se implementarán 3 tipos de rutas principales:
1.  **Triangulación Interna**: `Stable A -> BTC -> Stable B`. (Baja latencia).
2.  **Cross-Exchange Bridge**: Comprar ETH en Exchange A, vender en Exchange B por Stable.
3.  **Cross-Stable Bridge**: Utilizar ETH para arbitrar el desvío de paridad entre diferentes stablecoins en DEX y CEX.

## 3. Parámetros de Riesgo y ViT (CFO)
La "Volatility-in-Transit" (ViT) es el KPI crítico:
*   **Tiempo Límite**: Max 120s para BTC, 90s para ETH.
*   **Slippage**: Max 0.3% adverso.
*   **Auto-Hedging**: Activación de cortos en perpetuos si el tiempo de tránsito excede los 5 minutos.

## 4. Especificaciones Técnicas (CTO)
*   **Protocolo**: OpenSpec Binaria V1.
*   **Asset Support**: BTC (0x0001), ETH (0x0002).
*   **Performance**: Procesamiento en thread de alta prioridad para activos puente.
*   **Precision**: Fixed-point int64 (1e8).

## 5. Roadmap de Implementación (COO)
1.  **Fase 1**: Simulaciones de Monte Carlo para calcular el ViT real en condiciones de red estresada.
2.  **Fase 2**: Implementación de los AssetIDs en el motor de ejecución.
3.  **Fase 3**: Live testing con tamaños de orden mínimos (Dust-testing) en rutas `USDT->BTC->DAI`.

---
**Aprobado por: Atlas (COO) / GHO-Apex Executive Board**
