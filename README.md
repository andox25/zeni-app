# Mis Finanzas — Proyecto

Aplicación personal de control financiero. Self-contained en un solo archivo HTML, sin servidores ni dependencias externas.

---

## Cómo usar

1. Abrir `finanzas_v4.html` en el navegador
2. La app guarda los datos automáticamente en **localStorage** del navegador
3. Al cerrar sesión → exportar el JSON desde la app y guardarlo en esta carpeta con la fecha de hoy

---

## Estructura de la carpeta

```
FINANZAS APP/
├── finanzas_v4.html              ← App principal
├── mis-finanzas-YYYY-MM-DD.json  ← Datos exportados (nombrar con fecha)
├── README.md                      ← Este archivo
└── bitacora/
    └── YYYY-MM-DD.md              ← Resumen de cada sesión de trabajo
```

---

## Bitácora

Cada sesión de trabajo genera un archivo en `/bitacora/` con el nombre de la fecha (`YYYY-MM-DD.md`). Contiene:
- Resumen de lo que se hizo
- Estado financiero al cierre
- Pendientes para la próxima sesión

**Leer siempre el último archivo de bitácora antes de empezar una sesión nueva.**

---

## Datos importantes

- Los datos viven en el **localStorage** del navegador → no se pierden al cerrar la pestaña, pero sí si se limpia el caché
- Para respaldar: exportar el JSON desde la app y guardarlo aquí
- Para restaurar: importar el JSON desde la app

---

*Proyecto iniciado: 2026-05-05*
