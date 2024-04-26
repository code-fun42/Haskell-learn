{-# LANGUAGE InstanceSigs #-}

module Medical.Blood
  ( ABOType (..),
    RhType (..),
    BloodType (..),
    transfusion,
  )
where

data RhType = Pos | Neg deriving (Show, Eq)

data ABOType = O | A | B | AB deriving (Show, Eq)

data BloodType = BloodType ABOType RhType deriving (Show, Eq)

data Donor = Donor BloodType deriving (Show, Eq)

data Recipient = Recipient BloodType deriving (Show, Eq)

data BloodTransfusion = BloodTransfusion Donor Recipient deriving (Show, Eq)

data BloodTransfusionResult = Maybe BloodType deriving (Show, Eq)

transfusion :: BloodType -> BloodType -> Maybe BloodType
transfusion donor recipient
  | donor == recipient = Just donor
  | elem donor [(BloodType O Neg)] && recipient == (BloodType O Neg) = Just (BloodType O Neg)
  | elem donor [(BloodType O Neg), (BloodType O Pos)] && recipient == (BloodType O Pos) = Just (BloodType O Pos)
  | elem donor [(BloodType O Neg), (BloodType A Pos)] && recipient == (BloodType A Neg) = Just (BloodType A Neg)
  | elem
      donor
      [ (BloodType O Neg),
        (BloodType O Pos),
        (BloodType A Neg),
        (BloodType A Pos)
      ]
      && recipient == (BloodType A Pos) =
      Just (BloodType A Pos)
  | elem donor [(BloodType O Neg), (BloodType B Neg)] && recipient == (BloodType B Neg) = Just (BloodType B Neg)
  | elem
      donor
      [ (BloodType O Neg),
        (BloodType O Pos),
        (BloodType B Neg),
        (BloodType B Pos)
      ]
      && recipient == (BloodType B Pos) =
      Just (BloodType B Pos)
  | elem
      donor
      [ (BloodType O Neg),
        (BloodType A Neg),
        (BloodType B Neg),
        (BloodType AB Neg)
      ]
      && recipient == (BloodType AB Neg) =
      Just (BloodType AB Neg)
  | elem
      donor
      [ (BloodType O Neg),
        (BloodType O Pos),
        (BloodType A Neg),
        (BloodType A Pos),
        (BloodType B Neg),
        (BloodType B Pos),
        (BloodType AB Neg),
        (BloodType AB Pos)
      ]
      && recipient == (BloodType AB Pos) =
      Just (BloodType AB Pos)
  | otherwise = Nothing
