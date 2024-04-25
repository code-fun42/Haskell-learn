{-# LANGUAGE InstanceSigs #-}

module Medical.Blood
  ( ABOType (..),
    RhType (..),
    BloodType (..),
  )
where

data RhType = Pos | Neg deriving (Show, Eq)

data ABOType = O | A | B | AB deriving (Show, Eq)

data BloodType = BloodType ABOType RhType deriving (Show, Eq)

instance Semigroup BloodType where
  (<>) :: BloodType -> BloodType -> BloodType
  (<>) a b
    | a == b = a
    | elem a [(BloodType O Neg)] && b == (BloodType O Neg) = (BloodType O Neg)
    | elem a [(BloodType O Neg), (BloodType O Pos)] && b == (BloodType O Pos) = (BloodType O Pos)
    | elem a [(BloodType O Neg), (BloodType A Pos)] && b == (BloodType A Neg) = (BloodType A Neg)
    | elem a [(BloodType O Neg), (BloodType O Pos), (BloodType A Neg), (BloodType A Pos)] && b == (BloodType A Pos) = (BloodType A Pos)
    | elem a [(BloodType O Neg), (BloodType B Neg)] && b == (BloodType B Neg) = (BloodType B Neg)
    | elem a [(BloodType O Neg), (BloodType O Pos), (BloodType B Neg), (BloodType B Pos)] && b == (BloodType B Pos) = (BloodType B Pos)
    | elem a [(BloodType O Neg), (BloodType A Pos), (BloodType B Neg), (BloodType AB Neg)] && b == (BloodType AB Neg) = (BloodType AB Neg)
    | elem
        a
        [ (BloodType O Neg),
          (BloodType O Pos),
          (BloodType A Neg),
          (BloodType A Pos),
          (BloodType B Neg),
          (BloodType B Pos),
          (BloodType AB Neg),
          (BloodType AB Pos)
        ]
        && b == (BloodType AB Pos) =
        (BloodType AB Pos)
    | otherwise = (BloodType AB Pos)
