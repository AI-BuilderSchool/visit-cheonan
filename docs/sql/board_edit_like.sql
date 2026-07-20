-- 본인 글 수정/삭제 + 좋아요(하트) 기능 추가용 SQL
-- Supabase 대시보드 > SQL Editor 에서 한 번 실행하세요.
-- (이 저장소의 코드는 Supabase anon key로만 동작하므로, 테이블/정책 생성은
--  이 스크립트를 통해 사용자가 직접 실행해야 합니다.)

-- =========================================
-- 1) 본인 후기(reviews) 수정/삭제 허용
-- =========================================
drop policy if exists "users can update own review" on public.reviews;
create policy "users can update own review" on public.reviews
  for update
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

drop policy if exists "users can delete own review" on public.reviews;
create policy "users can delete own review" on public.reviews
  for delete
  using (auth.uid() = user_id);

-- =========================================
-- 2) 본인 질문(questions) 수정/삭제 허용
-- =========================================
drop policy if exists "users can update own question" on public.questions;
create policy "users can update own question" on public.questions
  for update
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

drop policy if exists "users can delete own question" on public.questions;
create policy "users can delete own question" on public.questions
  for delete
  using (auth.uid() = user_id);

-- =========================================
-- 3) 후기 좋아요 (review_likes)
-- =========================================
create table if not exists public.review_likes (
  review_id uuid not null references public.reviews(id) on delete cascade,
  user_id uuid not null references auth.users(id) on delete cascade,
  created_at timestamptz not null default now(),
  primary key (review_id, user_id)
);

alter table public.review_likes enable row level security;

drop policy if exists "public can read review likes" on public.review_likes;
create policy "public can read review likes" on public.review_likes
  for select using (true);

drop policy if exists "users can like reviews" on public.review_likes;
create policy "users can like reviews" on public.review_likes
  for insert
  with check (auth.uid() = user_id);

drop policy if exists "users can unlike own review like" on public.review_likes;
create policy "users can unlike own review like" on public.review_likes
  for delete
  using (auth.uid() = user_id);

-- =========================================
-- 4) 질문 좋아요 (question_likes)
-- =========================================
create table if not exists public.question_likes (
  question_id bigint not null references public.questions(id) on delete cascade,
  user_id uuid not null references auth.users(id) on delete cascade,
  created_at timestamptz not null default now(),
  primary key (question_id, user_id)
);

alter table public.question_likes enable row level security;

drop policy if exists "public can read question likes" on public.question_likes;
create policy "public can read question likes" on public.question_likes
  for select using (true);

drop policy if exists "users can like questions" on public.question_likes;
create policy "users can like questions" on public.question_likes
  for insert
  with check (auth.uid() = user_id);

drop policy if exists "users can unlike own question like" on public.question_likes;
create policy "users can unlike own question like" on public.question_likes
  for delete
  using (auth.uid() = user_id);
