module Medical.Blood (
    ABOType(..),
    RhType(..),
    BloodType(..)
) where

data RhType = Pos | Neg deriving (Show)

data ABOType = O | A | B | AB deriving (Show)

data BloodType = BloodType ABOType RhType deriving (Show)
