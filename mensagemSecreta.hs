main :: IO ()
main = do
  let codigos = [79, 98, 114, 105, 103, 97, 100, 111, 33]
      mensagemSecreta = map (\code -> toEnum code :: Char) codigos
  putStrLn mensagemSecreta