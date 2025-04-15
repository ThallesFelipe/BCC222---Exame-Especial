import System.IO (BufferMode (NoBuffering), hSetBuffering, stdout)

-- Função para calcular a média ponderada e determinar o conceito
calculaConceito :: Double -> Double -> Double -> Char
calculaConceito lab sem final
  | media >= 8.0 = 'A'
  | media >= 7.0 = 'B'
  | media >= 6.0 = 'C'
  | media >= 4.0 = 'D'
  | otherwise = 'E' -- Cobre o intervalo [0.0 - 4.0[ (e notas < 0, se fossem permitidas)
  where
    -- Calcula a média ponderada usando os pesos dados
    media = (lab * 2.5 + sem * 3.0 + final * 4.5) / 10.0

main :: IO ()
main = do
  -- Garante que os prompts sejam exibidos antes da leitura
  hSetBuffering stdout NoBuffering

  -- Solicita e lê a nota do laboratório
  putStr "Digite a nota do trabalho de laboratório: "
  -- readLn lê uma linha e a converte. :: IO Double especifica o tipo de retorno esperado.
  notaLab <- readLn :: IO Double

  -- Solicita e lê a nota do seminário
  putStr "Digite a nota da apresentação de semináro: "
  notaSem <- readLn :: IO Double

  -- Solicita e lê a nota do exame final
  putStr "Digite a nota do exame final: "
  notaFinal <- readLn :: IO Double

  -- Calcula o conceito usando a função auxiliar
  let conceito = calculaConceito notaLab notaSem notaFinal

  -- Exibe o resultado. Coloca o Char 'conceito' em uma lista para formar uma String.
  putStrLn ("\nConceito obtido: " ++ [conceito])