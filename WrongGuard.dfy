// Expected verification failure: the loop stops at n + 1, not n.
method CountToWithWrongGuard(n: nat) returns (i: nat)
  ensures i == n
{
  i := 0;
  while i <= n
    invariant 0 <= i <= n + 1
    decreases n + 1 - i
  {
    i := i + 1;
  }
}
