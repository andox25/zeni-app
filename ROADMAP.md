# Mis Finanzas — Roadmap Completo
**De app personal a producto real · Solo con IA · Sin contratar nadie**

---

## Filosofía del proyecto

- **Cero contrataciones** — todo se construye con IA (Claude, ChatGPT, Gemini, Midjourney, etc.)
- **Validar antes de escalar** — primero PWA, luego app nativa solo si hay usuarios reales
- **Costos mínimos** — hosting gratis, base de datos gratis, solo pagamos dominio y ads

---

## FASE 0 — DEFINICIÓN · Semana 1

**Objetivo:** Tener claridad total antes de construir nada.

### Decisiones a tomar
- **Nombre de la app** — corto, memorable, disponible como dominio (.com o .app)
  - Herramientas: Claude + ChatGPT para generar opciones, Namecheap para verificar disponibilidad
- **Modelo de negocio** — definir exactamente qué va gratis y qué se cobra
  - Opción sugerida: Freemium — app gratis con hasta X movimientos/mes, premium ilimitado ($3–5/mes)
- **Target** — quién es el usuario ideal
  - Perfil sugerido: 25–40 años, LATAM, trabaja, tiene ingresos variables o deudas, quiere ordenarse
- **Diferenciador** — qué tiene esta app que no tienen Mint, YNAB, Fintonic, etc.
- **Dominio** — registrar en Namecheap (~$12/año)

---

## FASE 1 — TÉCNICO · Semanas 1–2

**Objetivo:** La app funciona en el celular sin necesitar App Store.

### PWA (Progressive Web App)
- Agregar `manifest.json` — nombre, ícono, color, orientación
- Agregar `service-worker.js` — funciona offline, se cachea en el celular
- Probar instalación en iPhone (Safari → Agregar a pantalla de inicio) y Android (Chrome)
- Ajustes UX pendientes en la v4

### App nativa (Fase posterior — Mes 3+)
- Framework: **React Native** (recomendado) o Flutter
- Una sola base de código → iOS + Android simultáneo
- Herramientas: Claude + Cursor AI para escribir el código
- Publicar en App Store ($99/año Apple) y Google Play ($25 único)

---

## FASE 2 — INFRAESTRUCTURA · Semanas 2–3

**Objetivo:** Los datos están en la nube, los usuarios se registran con email.

### Stack recomendado (gratis o casi gratis)

| Servicio | Uso | Costo |
|---|---|---|
| **Vercel** | Hosting de la app y landing page | Gratis |
| **Supabase** | Base de datos PostgreSQL + autenticación | Gratis hasta 500MB |
| **Namecheap** | Dominio propio | ~$12/año |
| **Stripe** | Pagos y suscripciones (cuando aplique) | 0% fijo + 2.9% por transacción |

### Qué cambia técnicamente
- Los datos pasan de **localStorage** (solo en ese navegador) a **Supabase** (en la nube, cualquier dispositivo)
- Sistema de registro con email — pantalla de login, verificación, recuperar contraseña
- Login social (Google, Apple) — más conversión, menos fricción
- Backup automático de datos por usuario

---

## FASE 3 — LEGAL Y CIBERSEGURIDAD · Semanas 3–4

**Objetivo:** Proteger al usuario y protegernos legalmente.

### Documentos legales
- **Política de Privacidad** — qué datos recopilamos, cómo los usamos, cómo los eliminamos
  - Herramienta: Claude genera el draft, revisar con un abogado si escalamos
- **Términos y Condiciones** — reglas de uso, limitación de responsabilidad
- **Cumplimiento GDPR** — si tenemos usuarios europeos (botón de borrar cuenta, exportar datos)
- **Banner de cookies** — consentimiento explícito antes de trackear
- **Aviso de menores** — app para mayores de 18

### Seguridad técnica
- **HTTPS forzado** — certificado SSL automático (Vercel lo incluye gratis)
- **Encriptación en tránsito** — todos los datos viajan cifrados
- **Encriptación en reposo** — datos financieros encriptados en la base de datos
- **Row Level Security (RLS)** en Supabase — cada usuario SOLO puede ver sus propios datos
- **Autenticación segura** — JWT tokens, sesiones con expiración, refresh tokens
- **Rate limiting** — máximo X intentos de login por hora (evita ataques de fuerza bruta)
- **2FA opcional** — autenticación de dos factores para usuarios que quieran
- **Backups diarios automáticos** — Supabase lo hace por defecto
- **Logs de acceso** — saber quién entró, cuándo y desde dónde
- **No guardar contraseñas** — solo hashes (bcrypt), nunca texto plano

---

## FASE 4 — MARCA E IDENTIDAD · Semanas 2–4

**Objetivo:** Una identidad visual profesional creada 100% con IA.

### Identidad visual
- **Logo** — varias versiones (app, horizontal, solo ícono)
  - Herramientas: Midjourney, DALL-E 3, Ideogram, Adobe Firefly
- **Paleta de colores** — colores primarios, secundarios, estados (éxito, error, alerta)
- **Tipografía** — fuentes para títulos y texto (Google Fonts, gratuitas)
- **Brand kit** — plantillas para posts, stories, anuncios en Canva
- **Ícono de app** — 1024x1024px para App Store y Google Play

### Landing page
- Página web de presentación del producto
  - Hero con propuesta de valor clara
  - Screenshots de la app
  - Funcionalidades principales
  - Testimonios (beta users)
  - CTA: Descargar / Registrarse
- **SEO básico** — meta tags, Open Graph, palabras clave en español
- **Lista de espera** — capturar emails antes del lanzamiento
- Herramienta: Claude construye el HTML/CSS

---

## FASE 5 — MARKETING · Mes 2

**Objetivo:** Audiencia antes de lanzar, no después.

### Contenido orgánico (gratis)
- **Instagram y TikTok** como canales principales
- Tipo de contenido que funciona en finanzas:
  - Tips de ahorro y control de gastos
  - "Cuánto debería gastar en X"
  - Datos curiosos de finanzas en LATAM
  - Antes/después de usar la app
  - Errores comunes con el dinero
- **Frecuencia:** mínimo 3 posts/semana
- **Videos con IA:** HeyGen (avatar de IA), ElevenLabs (voz en off), Runway ML (video)
- **Diseño:** Canva AI, Adobe Express
- **Copys y guiones:** Claude + ChatGPT

### Meta Ads (pauta pagada)
- Instalar Meta Pixel en la landing page desde el día 1
- **Primer test:** $20–50 — validar el mensaje antes de escalar
- **Audiencias sugeridas:**
  - Edad: 25–45
  - Intereses: finanzas personales, ahorro, inversión, deudas, presupuesto
  - Geografía: Panamá + LATAM
  - Comportamiento: usuarios de apps de finanzas
- **Creativos con IA:** DALL-E 3 para imágenes, Runway ML para videos cortos
- **Formatos:** Stories, Reels, Feed — probar los 3 y ver cuál convierte mejor
- **Meta:** medir costo por registro, optimizar hasta tener CAC sostenible

---

## FASE 6 — LANZAMIENTO · Mes 2–3

**Objetivo:** Usuarios reales, feedback real, ajustes antes de escalar.

### Beta cerrada
- 10–20 usuarios de confianza (familia, amigos, contactos)
- Encuesta de feedback post-uso (Claude crea el formulario en Google Forms)
- Reunión/call para escuchar feedback directo
- Iterar: corregir lo que confunde, agregar lo que falta

### Lanzamiento público
- Post de lanzamiento en redes (video + carrusel + stories)
- **Product Hunt** — listing gratuito, comunidad de early adopters tech
- Activar Meta Ads con presupuesto real
- Email a la lista de espera

### Métricas a medir desde el día 1
- Registros por día
- Retención a los 7 días (cuántos siguen usando)
- Retención a los 30 días
- Conversión de gratis a premium
- Costo de adquisición por usuario (CAC)

---

## Herramientas de IA por área

| Área | Herramientas |
|---|---|
| Código y lógica | Claude, ChatGPT, Cursor AI, GitHub Copilot |
| Imágenes y gráficos | Midjourney, DALL-E 3, Ideogram, Canva AI |
| Videos | Runway ML, Sora, HeyGen, CapCut AI |
| Voz y audio | ElevenLabs, Adobe Podcast |
| Copys y textos | Claude, ChatGPT, Gemini |
| Documentos legales | Claude (draft inicial) |
| Estrategia y PM | Claude |

---

## Costos estimados (primer trimestre)

| Item | Costo |
|---|---|
| Dominio | ~$12/año |
| Hosting (Vercel) | Gratis |
| Base de datos (Supabase) | Gratis |
| Herramientas IA (Claude, ChatGPT) | Ya disponibles |
| Meta Ads — test inicial | $50–100 |
| Apple Developer (si va App Store) | $99/año |
| **Total mínimo** | **~$62–112 primer trimestre** |

---

## Bitácora

Ver carpeta `/bitacora/` para el historial de sesiones de trabajo.

---

*Documento creado: 2026-05-06 | Versión 1.0*
