// 주제: 배열 순회. PrefixSum은 결과의 의미를 정의하는 수학적 함수다.
function PrefixSum(a: array<int>, n: nat): int
  requires n <= a.Length
  reads a
  decreases n
{
  if n == 0 then 0 else PrefixSum(a, n - 1) + a[n - 1]
}

method ArraySum(a: array<int>) returns (sum: int)
  ensures sum == PrefixSum(a, a.Length)
{
  var i := 0;
  sum := 0;
  while i < a.Length
    invariant 0 <= i <= a.Length
    invariant sum == PrefixSum(a, i)
    decreases a.Length - i
  {
    sum := sum + a[i];
    i := i + 1;
  }
}
