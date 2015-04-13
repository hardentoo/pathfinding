module Example.Grid2 where

import PathFinding.Algorithm
import PathFinding.Grid

grid2 :: Grid Char
grid2 = Grid
    { _neighbor = gridNeighbors8 (/= 'O')
    , _carte =
        [ "..OO.."
        , "....O."
        , "O.O..."
        , "O.O..O"
        , "..OOOO"
        ]
    }



