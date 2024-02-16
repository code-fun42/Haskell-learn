import Cache (size)

factorial''' m =
  let helper acc n =
        if n > 1
          then helper (acc * n) (n - 1)
          else acc
   in helper 1 m

getSize = size