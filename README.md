# Dafny Hoare Logic Examples

짧은 Dafny 예제로 사전조건·사후조건, Hoare 논리, 반복문 불변식, 종료 증명을 살펴본다. PL 입문 스터디와 Reynolds *Theories of Programming Languages* 3장 도입에 사용할 수 있다.

## 시작하기

[Dafny 4.11.0](https://dafny.org/v4.11.0/)을 설치하고 각 파일을 검증한다.

```sh
dafny verify Increment.dfy
dafny verify CountTo.dfy
```

성공 예제는 `1 verified, 0 errors`를 출력한다. 다음 두 파일은 실패 원인을 비교하기 위한 의도된 실패 예제다.

```sh
dafny verify MissingInvariant.dfy  # 의도된 사후조건 증명 실패
dafny verify WrongGuard.dfy        # 의도된 사후조건 증명 실패
```

`MissingInvariant`는 실제 반복문 동작은 맞지만 상한 불변식이 없어 검증기가 사후조건을 증명하지 못한다. `WrongGuard`는 `n = 0`일 때 `i = 1`을 반환하므로 사후조건 자체가 틀린다.

## 예제

| 파일 | 주제 | 결과 |
|---|---|---|
| `Increment.dfy` | 계약과 대입문 | 통과 |
| `CountTo.dfy` | 불변식과 종료 척도 | 통과 |
| `MissingInvariant.dfy` | 증명 정보 부족 | 의도된 실패 |
| `WrongGuard.dfy` | 잘못된 반복 조건 | 의도된 실패 |
| `Swap.dfy` | 배열, `modifies`, `old` | 통과 |
| `Factorial.dfy` | 재귀 종료와 귀납적 보조정리 | 통과 |
| `ArraySum.dfy` | 누적 루프와 접두 합 | 통과 |
| `BinarySearch.dfy` | 구간 불변식과 부재 증명 | 통과 |
| `SortThree.dfy` | 정렬과 원소 보존 | 통과 |

`CountTo.dfy`는 `decreases n - i`를 명시한다. Dafny가 이 감소 척도로 종료를 증명한다. [Dafny 종료 설명](https://dafny.org/v4.11.0/OnlineTutorial/Termination).

관련 Lean 정의와 규칙은 [Spec.lean](https://github.com/Maokami/tpl-in-lean/blob/main/Reynolds/Answers/Ch03/Spec.lean), [Hoare.lean](https://github.com/Maokami/tpl-in-lean/blob/main/Reynolds/Answers/Ch03/Hoare.lean), [Total.lean](https://github.com/Maokami/tpl-in-lean/blob/main/Reynolds/Answers/Ch03/Total.lean)에 있다.
