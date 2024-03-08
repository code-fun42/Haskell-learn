import Cache (size)

factorial''' m =
  let helper acc n =
        if n > 1
          then helper (acc * n) (n - 1)
          else acc
   in helper 1 m

getSize = size

isCache :: Bool
isCache = True

-- foo :: Double -> Double -> Double -> Int
foo :: Double -> Double -> Double -> Int
foo x y z = round (10 * x + y + z)

-- 1:40:30

k :: Char -> Bool -> Char
k x1 x2 = x1

-- calcChange owed given =
--   if given - owed > 0
--     then given - owed
--     else 0

calcChange owed given =
  if change > 0
    then change
    else 0
  where
    change = given - owed

doublePlusTwo x = doubleX + 2
  where
    doubleX = x * 2

-- 1. Функция должна что-то возвращать

-- 2:

inc n = n + 1

double n = n * 2

square n = n ^ 2

-- 3:

isEven n =
  if even n
    then n - 2
    else 3 * n + 1

-- страница 46