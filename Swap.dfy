// 주제: 가변 상태. old는 호출 전 배열 값이며 modifies는 수정 가능한 객체다.
method Swap(a: array<int>, i: nat, j: nat)
  requires i < a.Length && j < a.Length
  modifies a
  ensures a[i] == old(a[j]) && a[j] == old(a[i])
  ensures forall k :: 0 <= k < a.Length && k != i && k != j ==> a[k] == old(a[k])
{
  var tmp := a[i];
  a[i] := a[j];
  a[j] := tmp;
}
