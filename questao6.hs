data Arv a = V | N a [Arv a] deriving (Eq, Show)

instance Functor Arv where
  -- Caso 1: Árvore vazia. Aplicar f não faz nada. Retorna V.
  fmap :: (a -> b) -> Arv a -> Arv b
  fmap f V = V
  -- Caso 2: Nó. Aplica f ao valor 'x' e aplica recursivamente fmap f
  -- a cada subárvore na lista 'subtrees' usando map.
  fmap f (N x subtrees) = N (f x) (map (fmap f) subtrees)