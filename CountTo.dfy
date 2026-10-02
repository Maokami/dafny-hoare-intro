method CountTo(n: nat) returns (i: nat)
  ensures i == n
{
  i := 0;
  while i < n
    invariant 0 <= i <= n
    decreases n - i
  {
    i := i + 1;
  }
}
