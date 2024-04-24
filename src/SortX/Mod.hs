module SortX.Mod where

import SortX.Shell

bubbleSort :: (Ord a, Eq a) => [a] -> [a]
bubbleSort [] = []
bubbleSort (f:s:xs) = s:xs

