// 주제: 이진 탐색. [lo, hi) 밖에는 찾는 값이 없다는 불변식을 유지한다.
method BinarySearch(a: array<int>, target: int) returns (index: int)
  requires forall i, j :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  ensures index == -1 || (0 <= index < a.Length && a[index] == target)
  ensures index == -1 ==> forall k :: 0 <= k < a.Length ==> a[k] != target
{
  var lo := 0;
  var hi := a.Length;
  index := -1;
  while lo < hi
    invariant 0 <= lo <= hi <= a.Length
    invariant forall k :: (0 <= k < lo || hi <= k < a.Length) ==> a[k] != target
    decreases hi - lo
  {
    var mid := lo + (hi - lo) / 2;
    if a[mid] < target {
      lo := mid + 1;
    } else if target < a[mid] {
      hi := mid;
    } else {
      index := mid;
      return;
    }
  }
}
