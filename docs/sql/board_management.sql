-- 게시판 관리 기능 추가용 SQL
-- Supabase 대시보드 > SQL Editor 에서 한 번 실행하세요.
-- (이 저장소의 코드는 Supabase anon key로만 동작하므로, 테이블/정책 생성은
--  이 스크립트를 통해 사용자가 직접 실행해야 합니다.)

-- =========================================
-- 1) Discover Local 후기 게시판(reviews) — 사진 필드 추가
-- =========================================
alter table public.reviews add column if not exists photo_url text;

alter table public.reviews enable row level security;

drop policy if exists "admins manage reviews" on public.reviews;
create policy "admins manage reviews" on public.reviews
  for all
  using (exists (select 1 from public.admins a where a.user_id = auth.uid()))
  with check (exists (select 1 from public.admins a where a.user_id = auth.uid()));

-- =========================================
-- 2) 공지사항 게시판 (notices)
-- =========================================
create table if not exists public.notices (
  id bigint generated always as identity primary key,
  title text not null,
  content text not null,
  author_name text not null default '관리자',
  created_at timestamptz not null default now()
);

alter table public.notices enable row level security;

drop policy if exists "public can read notices" on public.notices;
create policy "public can read notices" on public.notices
  for select using (true);

drop policy if exists "admins manage notices" on public.notices;
create policy "admins manage notices" on public.notices
  for all
  using (exists (select 1 from public.admins a where a.user_id = auth.uid()))
  with check (exists (select 1 from public.admins a where a.user_id = auth.uid()));

-- =========================================
-- 3) 질문하기 게시판 (questions)
-- =========================================
create table if not exists public.questions (
  id bigint generated always as identity primary key,
  user_id uuid not null references auth.users(id) on delete cascade,
  author_name text not null,
  title text not null,
  content text not null,
  answer text,
  answered_at timestamptz,
  created_at timestamptz not null default now()
);

alter table public.questions enable row level security;

drop policy if exists "public can read questions" on public.questions;
create policy "public can read questions" on public.questions
  for select using (true);

drop policy if exists "users can insert own question" on public.questions;
create policy "users can insert own question" on public.questions
  for insert
  with check (auth.uid() = user_id);

drop policy if exists "admins manage questions" on public.questions;
create policy "admins manage questions" on public.questions
  for all
  using (exists (select 1 from public.admins a where a.user_id = auth.uid()))
  with check (exists (select 1 from public.admins a where a.user_id = auth.uid()));
