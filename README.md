# skin.estuary.kormod (Estuary MOD KOR)

Kodi 21 (Omega)용 Estuary 스킨 커스텀 빌드. 한글 폰트 추가 등 개인 커스터마이징 포함.

- 배포 페이지: https://bisury.github.io/skin.estuary.kormod/
- 저장소 URL (Kodi에 등록하는 주소): `https://bisury.github.io/skin.estuary.kormod/`

---

## 1. 스킨 설치하기 (기기당 1회)

Kodi에 저장소를 등록하고 스킨을 설치한다. 이 과정은 기기마다 한 번만 하면 되고,
이후 업데이트는 자동으로 받아온다.

1. Kodi 실행 → **설정**(톱니바퀴) → **파일 관리자** → **소스 추가**
2. `<None>` 선택 후 아래 주소 입력:
   ```
   https://bisury.github.io/skin.estuary.kormod/
   ```
   이름은 자유롭게 (예: `bisury`) → **확인**
3. **설정 → 시스템 → 애드온 → 알 수 없는 소스** 허용 (최초 1회)
4. 홈으로 나가서 **애드온** → 좌측 상단의 패키지 아이콘(상자) → **zip 파일에서 설치**
5. 파일 목록에서 추가한 소스(`bisury`) → `repository.bisury-1.0.0.zip` 선택
6. 우측 상단 알림으로 **"bisury Kodi Add-ons 애드온이 설치되었습니다"** 확인
7. **애드온 → 저장소에서 설치** → **bisury Kodi Add-ons** → **스킨** → **Estuary MOD KOR** → 설치
8. 설치 후 스킨 변경 여부를 물으면 **예** 선택

## 2. 업데이트하기

### 자동 업데이트 (기본 동작)

- **설정 → 애드온 → 업데이트**가 **자동 설치**로 되어 있으면(기본값)
  Kodi가 주기적으로 저장소를 확인해 새 버전을 자동 설치한다.
- 활성 스킨이 업데이트되면 스킨이 자동으로 리로드된다.

### 즉시 업데이트

- **애드온** 화면에서 좌측 메뉴 → **업데이트 확인**, 또는
- **애드온 → 내 애드온 → 인터페이스 스킨 → Estuary MOD KOR** 진입 → **업데이트**

현재 배포 버전은 [배포 페이지](https://bisury.github.io/skin.estuary.kormod/)에서 확인할 수 있다.

### 문제 해결

| 증상 | 확인할 것 |
|---|---|
| zip 설치가 실패함 | 소스 URL 오타 여부 (`https://` 포함 정확히), 알 수 없는 소스 허용 여부 |
| 저장소에서 스킨이 안 보임 | 저장소 설치 알림이 떴는지 확인, Kodi 재시작 |
| 업데이트가 나타나지 않음 | 배포 페이지에서 현재 버전 확인 → Kodi에서 업데이트 확인 또는 재시작 |
| 설치 후 화면이 이상함 | 스킨 재적용(설정 → 인터페이스 → 스킨) 또는 Kodi 재시작 |

## 3. 새 버전 배포하기 (관리자)

### 일반 배포

1. 작업 브랜치에서 커밋 → `main`에 병합(또는 `git push origin HEAD:main`)
2. GitHub Actions가 자동으로 실행된다 (`.github/workflows/publish.yml`):
   - 배포 버전 자동 결정 → 스킨 zip 생성
   - `addons.xml` + `addons.xml.md5` 갱신
   - GitHub Pages 배포 → `repo-v<버전>` 태그 기록
3. 기기에서는 다음 업데이트 확인 시점에 반영된다 (즉시 필요하면 위 방법으로 수동 확인)

Actions 실행 상태: 저장소 **Actions** 탭에서 확인.

### 버전 규칙

- `addon.xml`의 버전을 직접 올리면 그 버전이 그대로 배포된다
  (예: `21.2.1+omega.24` → `21.2.1+omega.30`으로 수정 후 push → `.30` 배포)
- 버전을 그대로 두면 마지막 배포 번호가 자동으로 +1 된다 (배포 `.30` → 다음 `.31`)
- 기준 버전(`21.2.1+omega`)을 바꾸면 번호는 소스 버전을 따른다

### 수동 배포

코드 변경 없이 재배포가 필요하면: **Actions → publish → Run workflow**.

## 4. 로컬 빌드 (테스트용)

배포와 상관없이 로컬에서 zip만 만들어 설치해볼 수 있다.

- Windows: `build.bat` 실행 → 상위 폴더에 `skin.estuary.kormod.zip` 생성
- 설치: **애드온 → zip 파일에서 설치**로 직접 설치 (저장소 경유 아님)
- 단, 이 방식으로 설치하면 저장소 업데이트와 버전이 어긋날 수 있으니 배포는 저장소 경유 권장

## 5. 구성 파일

| 경로 | 설명 |
|---|---|
| `.github/workflows/publish.yml` | 자동 배포 워크플로우 (push to main / 수동 실행) |
| `repo-addon/repository.bisury/addon.xml` | Kodi 저장소 애드온 정의 (버전 1.0.0 고정) |
| `repo-addon/index.html` | 배포 페이지 (현재 버전 표시) |
| `build.bat` | Windows 로컬 수동 빌드 스크립트 |

## 6. 폰트 라이선스

저장소에 포함된 폰트(Gmarket Sans, 넥슨 Lv.1 고딕, 한게임 포커, Paperlogy 등)는
각 제작사의 라이선스 정책을 따른다. 재배포 전 각 폰트의 사용 조건을 확인할 것.
