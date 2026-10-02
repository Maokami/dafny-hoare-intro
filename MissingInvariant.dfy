// Expected verification failure: the loop forgets the upper bound on i.
method CountToWithoutInvariant(n: nat) returns (i: nat)
  ensures i == n
{
  i := 0;
  while i < n
    decreases n - i
  {
    i := i + 1;
  }
}
