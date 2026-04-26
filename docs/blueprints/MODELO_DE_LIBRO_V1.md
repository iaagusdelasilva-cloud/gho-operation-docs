# Modelo de Libro: GHO-Apex V1

## 1. Pares Tranzables (Core)
El enfoque inicial es el despegue y arbitraje de GHO contra stablecoins mayores (Stable-to-Stable).

| Par | Base Asset | Quote Asset | Exchanges Iniciales |
| :--- | :--- | :--- | :--- |
| **GHO/USDC** | GHO | USDC | Uniswap V3, Aave V3, Balancer |
| **GHO/USDT** | GHO | USDT | Uniswap V3, Curve |
| **GHO/DAI** | GHO | DAI | Aave V3, Balancer, Uniswap V3 |

## 2. Estructura del Libro de Órdenes (Unified Orderbook)
Cada entrada en el libro debe contener:
- **Timestamp:** Nanosegundos (UTC).
- **Exchange ID:** Identificador único del pool/CEX.
- **Side:** Bid/Ask (o Buy/Sell para swaps).
- **Price:** Normalizado a 18 decimales.
- **Amount:** Cantidad disponible en el nivel de precio.
- **Liquidity Type:** Concentrated (UniV3), XYK (UniV2), StableSwap (Curve).

## 3. Resolución de Data Ingestion
- **L1 (Ticks):** Cada swap o cambio de liquidez. Esencial para backtesting de alta frecuencia.
- **L2 (Snapshot):** Estado del pool cada bloque.
- **L3 (Candles):** Agregados temporales para análisis de tendencias y risk management macro.

## 4. Validación de Backtesting
Todo par tranzable debe pasar por una fase de:
1. Ingesta de 30 días de históricos.
2. Reconstrucción de slippage real vs teórico.
3. Validación de costos de gas dinámicos.
