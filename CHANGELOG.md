# Changelog

이 문서는 `cheonan-visit` 프로젝트의 주요 변경 이력을 기록하는 문서입니다.
형식은 [Keep a Changelog](https://keepachangelog.com/ko/1.1.0/) 기준으로 작성합니다.

## [Unreleased]

### Added
- 프로젝트 문서 체계 정비: `README.md`, `CLAUDE.md`, `CHANGELOG.md` 문서 분리
- 폴더별 AI 작업 안내 파일 추가
- 로컬 보안 환경 변수 예시 파일 `.env` 구성

### Changed
- 루트 `CLAUDE.md`를 전체 워크스페이스 공통 규칙 중심으로 정리
- 프로젝트별 `CLAUDE.md`를 프로젝트 기본 정보, 범위, 관련 파일 중심으로 보강
- 문서 언어를 한국어로 통일

### Fixed
- GitHub에 API 키가 올라가지 않도록 `.env` 파일과 `.gitignore` 제외 규칙 반영

## [1.0.0] - 2026-07-12

### Added
- 천안 관광 소개 랜딩 페이지 초기 버전
- 다크 모드 토글
- Vercel 배포

<!--
작성 규칙:
- 새 변경은 [Unreleased] 아래에 추가하고, 배포 시 버전과 날짜를 붙여 확정합니다.
- 분류: Added(추가) / Changed(변경) / Fixed(수정) / Removed(제거)
- 한 줄에 하나의 변경, 사용자 관점에서 작성합니다.
-->
