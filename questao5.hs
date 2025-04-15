-- Definição da classe de tipo YesNo
class YesNo a where
  -- Método único: converte um valor do tipo 'a' para Bool
  yesno :: a -> Bool

-- Instância para Integer: 0 é 'no' (False), qualquer outro é 'yes' (True)
instance YesNo Integer where
  yesno :: Integer -> Bool
  yesno 0 = False
  yesno _ = True

-- Instância para listas: lista vazia é 'no' (False), não vazia é 'yes' (True)
instance YesNo [a] where
  yesno :: [a] -> Bool
  yesno [] = False -- Lista vazia
  yesno _ = True -- Lista não vazia

-- Instância para Bool: True é 'yes', False é 'no'
instance YesNo Bool where
  yesno :: Bool -> Bool
  yesno True = True
  yesno False = False

-- Instância para Maybe a: Nothing é 'no' (False), Just _ é 'yes' (True)
instance YesNo (Maybe a) where
  yesno :: Maybe a -> Bool
  yesno Nothing = False -- Representa falha ou ausência
  yesno (Just _) = True -- Representa sucesso ou presença

-- Definição do tipo algébrico Semaforo
data Semaforo = Verde | Amarelo | Vermelho deriving (Show, Eq) -- Adicionado deriving para testes

-- Instância YesNo para Semaforo: Vermelho é 'no', outros são 'yes'
instance YesNo Semaforo where
  yesno :: Semaforo -> Bool
  yesno Vermelho = False -- Deve parar
  yesno Verde = True -- Pode seguir
  yesno Amarelo = True -- O enunciado diz "geralmente acelero", implicando 'yes'

-- Assinatura de tipo: requer que o tipo 'a' da condição seja instância de YesNo
yesnoIf :: (YesNo a) => a -> b -> b -> b
-- Definição: usa a função 'yesno' da classe para avaliar a condição
yesnoIf condicao valorSeYes valorSeNo =
  if yesno condicao then valorSeYes else valorSeNo