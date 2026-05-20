-- ============================================================
-- ZENI — Schema de base de datos
-- Pegar completo en Supabase → SQL Editor → Run
-- ============================================================

-- Habilitar extensión UUID
create extension if not exists "uuid-ossp";

-- ============================================================
-- TABLAS
-- ============================================================

-- Movimientos (ingresos y gastos)
create table if not exists movimientos (
  id           uuid default uuid_generate_v4() primary key,
  user_id      uuid references auth.users(id) on delete cascade not null,
  tipo         text not null check (tipo in ('ingreso','gasto')),
  subtipo      text default '',
  descripcion  text not null,
  monto        decimal(12,2) not null,
  fecha        date not null,
  categoria    text default '',
  nota         text default '',
  created_at   timestamptz default now()
);

-- Deudas
create table if not exists deudas (
  id           uuid default uuid_generate_v4() primary key,
  user_id      uuid references auth.users(id) on delete cascade not null,
  acreedor     text not null,
  saldo        decimal(12,2) not null,
  fecha_pago   text default '',
  nota         text default '',
  created_at   timestamptz default now()
);

-- Fondos de ahorro
create table if not exists fondos (
  id           uuid default uuid_generate_v4() primary key,
  user_id      uuid references auth.users(id) on delete cascade not null,
  nombre       text not null,
  created_at   timestamptz default now()
);

-- Entradas a fondos
create table if not exists fondo_entradas (
  id           uuid default uuid_generate_v4() primary key,
  fondo_id     uuid references fondos(id) on delete cascade not null,
  user_id      uuid references auth.users(id) on delete cascade not null,
  monto        decimal(12,2) not null,
  nota         text default '',
  fecha        date default current_date,
  created_at   timestamptz default now()
);

-- Gastos compartidos (feature de parejas/amigos)
create table if not exists gastos_compartidos (
  id              uuid default uuid_generate_v4() primary key,
  owner_id        uuid references auth.users(id) on delete cascade not null,
  partner_id      uuid references auth.users(id) on delete cascade,
  partner_email   text,
  categoria       text not null,
  nombre_grupo    text default 'Gastos del hogar',
  status          text default 'pendiente' check (status in ('pendiente','activo','rechazado')),
  created_at      timestamptz default now()
);

-- Movimientos compartidos (vinculados a un gasto compartido)
create table if not exists movimientos_compartidos (
  id                    uuid default uuid_generate_v4() primary key,
  movimiento_id         uuid references movimientos(id) on delete cascade not null,
  gasto_compartido_id   uuid references gastos_compartidos(id) on delete cascade not null,
  user_id               uuid references auth.users(id) on delete cascade not null,
  created_at            timestamptz default now()
);

-- ============================================================
-- ROW LEVEL SECURITY (cada usuario solo ve sus datos)
-- ============================================================

alter table movimientos         enable row level security;
alter table deudas              enable row level security;
alter table fondos              enable row level security;
alter table fondo_entradas      enable row level security;
alter table gastos_compartidos  enable row level security;
alter table movimientos_compartidos enable row level security;

-- Políticas: usuario ve y modifica solo sus registros
create policy "movimientos_policy" on movimientos
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy "deudas_policy" on deudas
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy "fondos_policy" on fondos
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy "fondo_entradas_policy" on fondo_entradas
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

-- Gastos compartidos: el owner ve todos, el partner ve los suyos
create policy "gastos_compartidos_owner" on gastos_compartidos
  for all using (auth.uid() = owner_id or auth.uid() = partner_id);

create policy "movimientos_compartidos_policy" on movimientos_compartidos
  for all using (auth.uid() = user_id);

-- ============================================================
-- ÍNDICES para rendimiento
-- ============================================================

create index idx_movimientos_user    on movimientos(user_id, fecha desc);
create index idx_deudas_user         on deudas(user_id);
create index idx_fondos_user         on fondos(user_id);
create index idx_fondo_entradas_user on fondo_entradas(user_id);
