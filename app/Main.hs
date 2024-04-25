{-# LANGUAGE InstanceSigs #-}

module Main (main) where

import Lib

main :: IO ()
main = someFunc

data RhType = Pos | Neg deriving (Show)

data ABOType = O | A | B | AB deriving (Show)

data BloodType = BloodType ABOType RhType deriving (Show)

type FullName = (String, String)

data Patient = Patient
  { fstName :: String,
    sndName :: String,
    age :: Int,
    bloodType :: BloodType,
    fullName :: FullName,
    diagnosis :: String
  }

newPatient :: String -> String -> Int -> BloodType -> String -> Patient
newPatient fstName sndName age bloodType diagnosis =
  Patient
    { fstName = fstName,
      sndName = sndName,
      age = age,
      bloodType = bloodType,
      diagnosis = diagnosis,
      fullName = (fstName, sndName)
    }

p1 :: Patient
p1 = newPatient "John" "Doe" 30 (BloodType AB Pos) "gastritis"

class Analysis a where
  getBloodType :: a -> BloodType

instance Analysis Patient where
  getBloodType :: Patient -> BloodType
  getBloodType p = bloodType p