# cheonan-visit

천안 관광 소개 정적 랜딩 페이지입니다.

## 소개

천안의 관광 명소를 소개하는 단일 페이지 사이트입니다. CSS/JS가 모두 `index.html` 안에 인라인으로 포함된 자체 완결형 구조로, 빌드 과정 없이 바로 열어볼 수 있습니다.

## 실행 방법

1. `index.html`을 브라우저로 직접 열거나
2. VS Code Live Server 확장으로 미리보기를 실행합니다.

별도 패키지 설치나 빌드가 필요 없습니다.

## 구조

```
cheonan-visit/
├── index.html      # 페이지 전체 (HTML + 인라인 CSS/JS)
├── CLAUDE.md       # AI 작업 지침
├── CHANGELOG.md    # 변경 이력
└── docs/
    └── decisions.md  # 주요 결정 기록
```

## 특징

- 다크 모드 지원 (`:root[data-theme="dark"]` 토글)
- 이미지는 base64 data URI로 포함
- 외부 의존성 없음

## 배포

Vercel로 배포합니다. `.env`와 `.vercel`은 로컬 전용이며 커밋하지 않습니다.

## 문서 규칙

- 사용법·구조 변경 시 이 README를 함께 갱신합니다.
- 변경 사항은 `CHANGELOG.md`에 기록합니다.
- "왜 이렇게 했는지"에 해당하는 결정은 `docs/decisions.md`에 남깁니다.
