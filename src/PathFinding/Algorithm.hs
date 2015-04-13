{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeFamilies #-}

module PathFinding.Algorithm where

import qualified Data.Map as M
import PathFinding.Class
import Data.Proxy

-- TODO: remove the need to both have pos and neightboors
findPath :: (PathFinding carte, pos ~ Pos carte, Ord pos) => pos -> pos -> carte -> [pos]
findPath from to carte =
    dijkstra (mkqueue proxy [from]) M.empty
    where
    proxy = proxify carte
    backtrack currentPos visited = case M.lookup currentPos visited of
        Nothing -> []
        Just next -> let currPos = locate carte next in
            if currPos == from
            then [from]
            else currPos : backtrack currPos visited

    dijkstra open closed = case dequeue proxy open of
        Nothing ->  error "notFound"
        Just (curr, next) ->
            let currPos = locate carte curr
            in  if currPos == to
                then currPos : backtrack currPos closed
                else
                    let nbh = filter (\e -> M.notMember (locate carte e) closed) (neighbors carte currPos)
                    in dijkstra (enqueue proxy nbh next) (foldl (\c e -> M.insert (locate carte e) curr c) closed nbh)
