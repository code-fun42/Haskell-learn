module Main (main) where

import Lib
import Medical.Mod 
import Medical.Analysis (AnalysisBlood(getBloodType))

main :: IO ()
main = someFunc

p1 :: Patient
p1 = newPatient "John" "Doe" 30 (BloodType AB Pos) "gastritis"
bT = getBloodType p1
