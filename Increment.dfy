method Increment(x: int) returns (y: int)
  requires x >= 0
  ensures y > 0
{
  y := x + 1;
}
