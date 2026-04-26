# Plan de Diseño Estratégico (DDD + SDD) - GHO-Apex

## 1. Descubrimiento de Dominio
El negocio de GHO-Apex se dividirá en los siguientes subdominios:
- **Core Domain (El corazón del negocio)**: `Arbitrage Engine` (Ejecución de Alta Frecuencia) y `Risk Management` (ViT, Hedging, Slippage).
- **Supporting Domain (Apoyo crítico)**: `Data Ingestion & Ledger` (Captura de Ticks y Candles) y `Settlement` (Liquidación y conciliación de saldos).
- **Generic Domain (Infraestructura base)**: `Connectivity` (WebSockets, APIs de Exchanges).

## 2. Lenguaje Ubicuo (Ubiquitous Language)
Se erradica la ambigüedad. Ejemplos del glosario oficial:
- **Asset**: Stablecoin (USDC/USDT/DAI) o activo puente (BTC/ETH). **Nunca referirse a "GHO" como activo.**
- **Hot-Path**: El flujo de ejecución crítica donde no se permiten allocations ni bloqueos.
- **ViT (Volatility-in-Transit)**: Métrica de riesgo que mide la exposición al mercado en rutas multi-salto.

## 3. Bounded Contexts y Context Mapping
- **Trading Context**: Se encarga exclusivamente de identificar oportunidades y disparar órdenes.
- **Liquidity & Settlement Context**: Se encarga de rebalancear inventarios espejos.
- **Relación**: El *Trading Context* es **Upstream** (produce eventos de órdenes) y el *Settlement Context* es **Downstream** (reacciona para equilibrar).
- **Patrón Anti-Corruption Layer (ACL)**: Aislará al *Trading Context* de los cambios en las APIs de los CEX/DEX. El motor Core nunca habla directo con Binance; habla con el ACL.

## 4. Artefactos de Salida Esperados
1. **Diagrama C4 Nivel 1 (System Context)**: GHO-Apex interactuando con DEXs, CEXs y Nodos RPC.
2. **Diagrama C4 Nivel 2 (Container)**: El Monolito Modular en Go, mostrando el Data Lake, Ingestor, Engine y Risk Module.
3. **Core Domain Model**: Las entidades principales (Order, Tick, Route) en código.
