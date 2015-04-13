{-# LANGUAGE TypeFamilies #-}

module PathFinding.Class where
import           Data.Proxy

class PathFinding carte where
    type Queue carte
    type Pos carte
    type Neighbor carte

    -- ^ function to find neighboors from pos in carte
    neighbors :: carte -> Pos carte -> [Neighbor carte]
    locate    :: carte -> Neighbor carte -> Pos carte

    -- ^ queue manipulation to allow user-defined queues and specific
    -- optimizations
    mkqueue :: Proxy carte -> [Pos carte] -> Queue carte
    enqueue :: Proxy carte -> [Neighbor carte] -> Queue carte -> Queue carte
    dequeue :: Proxy carte -> Queue carte -> Maybe (Neighbor carte, Queue carte)

    -- ^ type-inference helper function
    proxify :: carte -> Proxy carte
    proxify _ = Proxy
