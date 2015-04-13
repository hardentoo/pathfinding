{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TypeFamilies #-}

module PathFinding.Grid where
import Data.Ix
import PathFinding.Class

data Grid cell = Grid
    { _carte    :: [[cell]]
    , _neighbor :: [[cell]] -> (Int,Int) -> [(Int,Int)]
    }

instance PathFinding (Grid cell) where
    type Pos      (Grid cell) = (Int, Int)
    type Queue    (Grid cell) = [Pos (Grid cell)]
    type Neighbor (Grid cell) = Pos (Grid cell)

    locate _ p = p
    neighbors Grid{..} = _neighbor _carte

    mkqueue _ positions = positions
    enqueue _ l q = l ++ q
    dequeue _ q = case q of
        [] -> Nothing
        (a:as) -> Just (a, as)

gridNeighbors4 = gridNeighbors (\(x,y) -> [(x+1,y),(x-1,y),(x,y+1),(x,y-1)])
gridNeighbors8 = gridNeighbors (\(x,y) -> [(x+1,y),(x-1,y),(x,y+1),(x,y-1),(x+1,y+1),(x-1,y-1),(x-1,y+1),(x+1,y-1)])
gridNeighbors closePos isFree carte (x,y) = filter isValid (closePos (x,y))
    where
    isValid x = if inMap x then notWall x else False -- FIXME => not goot, can raise exception
    notWall (i,j) = isFree ((carte !! j) !! i)
    inMap (a,b) =
        let (w, h) = labSize carte
        in  (0,w-1) `inRange` a && (0,h-1) `inRange` b

type Width  = Int
type Height = Int
labSize :: [[cell]] -> (Width, Height)
labSize l@(r1:_) = (length r1, length l)
