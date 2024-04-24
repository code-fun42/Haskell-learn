module Swap where

swap :: Int -> Int -> [a] -> [a]
swap _ _ [] = []
swap i j xs
    | i == j = xs
    | otherwise = let (beforeI, afterI) = splitAt i xs
                      (beforeJ, afterJ) = splitAt j xs
                  in init beforeI ++ [xs !! j] ++ tail beforeI ++
                     init beforeJ ++ [xs !! i] ++ tail beforeJ ++
                     afterI ++ [xs !! j] ++ tail afterJ
