{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE TypeFamilies #-}

module PathFinding.Graph where
import Data.Ix
import PathFinding.Class

import qualified Data.Map as Map
import Data.Map (Map)

type NodeID = Int
data Graph distanceUnit = Grid
    { _nodes :: Map NodeID [(NodeID, distanceUnit)]
    }

instance PathFinding (Graph u) where
    type Pos      (Graph u) = NodeID
    type Queue    (Graph u) = [(NodeID, u)]
    type Neighbor (Graph u) = (NodeID, u)

    locate _ p = undefined
    {-
    neighbors Grid{..} p = _neighbor _carte p

    mkqueue _ positions = positions
    enqueue _ l q = l ++ q
    dequeue _ q = case q of
        [] -> Nothing
        (a:as) -> Just (a, as)
    -}
