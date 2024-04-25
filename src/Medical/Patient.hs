{-# LANGUAGE InstanceSigs #-}

module Medical.Patient
  ( Patient (..),
    newPatient,
    getBloodType,
  )
where

import Medical.Analysis (AnalysisBlood (..))
import Medical.Blood (ABOType, BloodType, RhType)

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

instance AnalysisBlood Patient where
  getBloodType :: Patient -> BloodType
  getBloodType p = bloodType p
