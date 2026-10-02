// 주제: 정렬. 결과가 정렬되었고 입력 원소를 잃거나 만들지 않았음을 함께 증명한다.
method SortThree(a: int, b: int, c: int) returns (x: int, y: int, z: int)
  ensures x <= y && y <= z
  ensures multiset{x, y, z} == multiset{a, b, c}
{
  x, y, z := a, b, c;
  if x > y {
    x, y := y, x;
  }
  if y > z {
    y, z := z, y;
  }
  if x > y {
    x, y := y, x;
  }
}
