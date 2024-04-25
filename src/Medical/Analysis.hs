module Medical.Analysis
  ( AnalysisBlood (..),
  )
where

import Medical.Blood (BloodType)

class AnalysisBlood a where
  getBloodType :: a -> BloodType
