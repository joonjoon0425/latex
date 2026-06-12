## LaTeX 실용 팁

**각 아키텍처마다 일관된 템플릿 사용:**

- **개요** — 어떤 문제를 풀기 위해 만들어졌는가
- **핵심 아이디어** — 수식 위주 (`equation`, `align` 환경), 용어들도 여기서 정의하고 설명하기.
- **구조 다이어그램** — `tikz` 패키지로 직접 그리거나 `\includegraphics`
- **장단점 & 변형 모델** — `itemize` / `table`
- **구현 알고리즘** — 전부 다 말고 수도코드나 참조할만함 자료 정도만
- **대표 논문** — `biblatex`으로 참고문헌 관리

**유용한 패키지 조합:**
```latex
\usepackage{amsmath, amssymb}   % 수식
\usepackage{tikz}               % 아키텍처 다이어그램
\usepackage{algorithm2e}        % 알고리즘 pseudocode
\usepackage{booktabs}           % 깔끔한 표
\usepackage{hyperref}           % 목차 클릭 링크
\usepackage{cleveref}           % 수식/그림 상호참조
```