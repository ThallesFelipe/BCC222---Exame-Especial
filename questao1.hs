questao1 :: Int
questao1 =
  let x = if "bola" > "gato" then "sim" else "nao"
   in case reverse x of
        [] -> 0
        ['m', _, _] -> 2
        'o' : _ -> 3
        _ -> length x