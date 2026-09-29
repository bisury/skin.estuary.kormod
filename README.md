# skin.estuary.kormod (Estuary MOD KOR)

Kodi 21 (Omega)용 Estuary 스킨 커스텀 빌드. 한글 폰트 추가 등 개인 커스터마이징 포함.

## 자동 배포 (GitHub Actions)

`main` 브랜치에 push하면 `.github/workflows/publish.yml`이 실행된다.

1. `addon.xml` 버전과 배포 태그(`repo-v*`)를 비교해 배포 버전 자동 결정
   - 소스 버전이 이미 배포된 것과 같으면 마지막 빌드번호를 +1 (예: `21.2.1+omega.24` → `.25`)
   - 소스 버전을 직접 올리면 그 버전이 그대로 배포됨
2. 스킨 zip 생성 (`skin.estuary.kormod/` 폴더 포함)
3. `addons.xml` + `addons.xml.md5` 생성
4. `repository.bisury` zip 생성
5. GitHub Pages 배포: https://bisury.github.io/skin.estuary.kormod/
6. `repo-v<버전>` 태그 기록

수동 실행: 저장소 Actions 탭 → **publish** → Run workflow.
로컬 수동 빌드가 필요하면 기존대로 `build.bat` 사용.

## Kodi 기기 초기 설치 (기기당 1회)

1. Kodi: 설정 → 파일 관리자 → 소스 추가 → `https://bisury.github.io/skin.estuary.kormod/`
2. 애드온 → zip 파일에서 설치 → 추가한 소스 → `repository.bisury-1.0.0.zip`
3. 애드온 → 저장소에서 설치 → bisury Kodi Add-ons → **Estuary MOD KOR** 설치
4. 설정 → 애드온 → 업데이트: **자동** (기본값)

이후 `main`에 push만 하면 Kodi가 알아서 업데이트한다.
즉시 반영: 애드온 → Estuary MOD KOR → 업데이트 확인 (활성 스킨은 업데이트 후 자동 리로드).

## 폰트 라이선스

저장소에 포함된 폰트(Gmarket Sans, 넥슨 Lv.1 고딕, 한게임 포커, Paperlogy 등)는 각 제작사의 라이선스 정책을 따른다.
