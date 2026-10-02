// 주제: 재귀와 귀납법. 재귀 호출의 인자 n-1이 작아져 종료한다.
function Factorial(n: nat): nat
  decreases n
{
  if n == 0 then 1 else n * Factorial(n - 1)
}

lemma FactorialPositive(n: nat)
  ensures Factorial(n) > 0
  decreases n
{
  if n > 0 {
    FactorialPositive(n - 1);
  }
}
