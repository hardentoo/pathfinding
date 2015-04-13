module Example.Graph1 where

import PathFinding.Algorithm
import PathFinding.Graph
import qualified Data.Map as Map

graph1 :: Graph Double
graph1 = Grid
    { _nodes = Map.fromList
        [ (1, [(2, 4.0), (3, 5.5)])
        , (2, [(1, 4.0), (3, 5.5)])
        , (3, [(5, 4.0), (4, 4.0)])
        , (4, [])
        , (5, [])
        ]
    }



