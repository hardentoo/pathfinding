module Main where

import PathFinding.Algorithm
import qualified Example.Grid1 as Example
import qualified Example.Grid2 as Example


main = do
    print $ findPath (0,0) (5,0) Example.grid1
    print $ findPath (0,0) (5,0) Example.grid2
    print $ findPath (0,0) (5,0) Example.grid2
    return ()

{-
showPath :: Path -> Lab -> IO ()
showPath path lab = do
    print path
    let (w,h) = labSize lab
    forM_ [0..h-1] $ \i -> do
        forM_ [0..w-1] $ \j -> let cell = (j,i) in
            if elem cell path
            then putChar 'i'
            else putChar $ lab~>cell
        putStrLn ""

-}
