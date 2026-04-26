# Metodología OpenSpec (Standard SDD Workflow)

GHO-Apex adopta el estándar **OpenSpec** para asegurar que el desarrollo sea determinista y alineado. El dueño del proceso es el **CTO Pod**, quien garantiza que no se toque código sin una especificación aprobada.

## El Ciclo de Vida OpenSpec (Paso a Paso)

### 1. Change Proposal (Propuesta)
- **Actor:** Product Owner (COO) o CTO.
- **Acción:** Crear una carpeta de propuesta en `openspecs/proposals/ID_CAMBIO/`.
- **Contenido:** Archivo `PROPOSAL.md` definiendo el problema, la solución propuesta y los criterios de aceptación.

### 2. Specification (Especificación)
- **Actor:** CTO Pod (Arquitecto).
- **Acción:** Redactar la especificación técnica en `openspecs/proposals/ID_CAMBIO/SPEC.md`.
- **Foco:** Definir interfaces, esquemas de datos (binarios/Protobuf), estados y flujos lógicos. Es el "contrato" innegociable.

### 3. Design (Diseño de Implementación)
- **Actor:** CTO Pod (Ingeniero).
- **Acción:** Crear `DESIGN.md` en la misma carpeta.
- **Foco:** Detallar el "cómo" técnico: arquitectura de archivos, dependencias, algoritmos específicos y consideraciones de performance (p99 latency).

### 4. Tasks (Desglose de Trabajo)
- **Actor:** CTO Pod / SRE.
- **Acción:** Crear `TASKS.md` con la lista de tareas atómicas para la implementación.
- **Validación:** Cada tarea debe poder verificarse contra los criterios de aceptación de la Propuesta.

### 5. Review & Apply (Aprobación y Merge)
- **Actor:** Chairman / CEO.
- **Acción:** Revisión final de la Spec y el Design. Una vez aprobado, se procede a la ejecución del código.
- **Cierre:** Al finalizar, el OpenSpec se mueve al historial de `openspecs/merged/` para servir como documentación viva del sistema.

---
**Axioma:** "Agree before you build". La alineación ocurre en los specs, la ejecución en el código.
