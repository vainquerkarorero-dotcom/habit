-- ORBIT workspace cloud storage
-- Run this entire script in Supabase Dashboard > SQL Editor > New query.
-- The browser uses only the Supabase publishable key. Never put a service_role/secret key in index.html.

create table if not exists public.orbit_workspaces (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.orbit_workspaces enable row level security;

-- Remove/recreate these policies safely if the script is run more than once.
drop policy if exists "Users can read their own ORBIT workspace" on public.orbit_workspaces;
drop policy if exists "Users can create their own ORBIT workspace" on public.orbit_workspaces;
drop policy if exists "Users can update their own ORBIT workspace" on public.orbit_workspaces;
drop policy if exists "Users can delete their own ORBIT workspace" on public.orbit_workspaces;

create policy "Users can read their own ORBIT workspace"
  on public.orbit_workspaces for select
  to authenticated
  using (auth.uid() = user_id);

create policy "Users can create their own ORBIT workspace"
  on public.orbit_workspaces for insert
  to authenticated
  with check (auth.uid() = user_id);

create policy "Users can update their own ORBIT workspace"
  on public.orbit_workspaces for update
  to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

create policy "Users can delete their own ORBIT workspace"
  on public.orbit_workspaces for delete
  to authenticated
  using (auth.uid() = user_id);

grant select, insert, update, delete on public.orbit_workspaces to authenticated;

-- Optional: keep updated_at current when the row changes.
create or replace function public.orbit_set_updated_at()
returns trigger language plpgsql as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists orbit_workspaces_updated_at on public.orbit_workspaces;
create trigger orbit_workspaces_updated_at
before update on public.orbit_workspaces
for each row execute function public.orbit_set_updated_at();
