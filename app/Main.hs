module Main (main) where

import Lib
import Medical.Mod 

main :: IO ()
main = someFunc

p1 :: Patient
p1 = newPatient "John" "Doe" 30 (BloodType AB Pos) "gastritis"
bT = getBloodType p1

