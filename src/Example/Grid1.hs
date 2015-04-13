module Example.Grid1 where

import PathFinding.Algorithm
import PathFinding.Grid

grid1 :: Grid Char
grid1 = Grid
    { _neighbor = gridNeighbors4 (/= 'O')
    , _carte =
        ["..OO.."
        ,"....O."
        ,"O.O..."
        ,"O.O..O"
        ,"..OOOO"
        ]
    }



