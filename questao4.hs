type Time = String

type Gols = Int

type Jogo = ((Time, Gols), (Time, Gols))

type Campeonato = [Jogo]

type Pontos = Int

type Tabela = [(Time, Pontos)]

-- Função auxiliar para verificar se um jogo foi um empate E envolveu o time especificado
jogoEhEmpateDoTime :: Time -> Jogo -> Bool
jogoEhEmpateDoTime time ((timeA, golsA), (timeB, golsB)) =
  (timeA == time || timeB == time) -- O time participou do jogo?
    && (golsA == golsB) -- O jogo foi um empate?

empates :: Campeonato -> Time -> Int
empates campeonato time = length (filter (jogoEhEmpateDoTime time) campeonato)

-- Exemplo de Campeonato (do enunciado)
campMineiro :: Campeonato
campMineiro =
  [ (("cruzeiro", 0), ("atlético", 0)),
    (("uberlandia", 5), ("america", 1)),
    (("atletico", 1), ("america", 2)),
    (("uberlandia", 2), ("cruzeiro", 1)),
    (("uberlandia", 3), ("urt", 1)),
    (("atletico", 4), ("uberlandia", 4)),
    (("urt", 0), ("atletico", 1)),
    (("urt", 0), ("america", 2)),
    (("caldense", 3), ("atletico", 3))
  ]