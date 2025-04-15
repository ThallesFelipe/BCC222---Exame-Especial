contem :: (Eq a) => [a] -> [a] -> Bool
contem _ [] = True
contem xs (y : ys) = elem y xs && contem xs ys