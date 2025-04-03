module Main where

import Lib

main :: IO ()
main = do
  point <- newPoint 1.5 2.0
  printPoint point
  length <- pointLength point
  putStrLn $ "point length: " <> show length
  freePoint point
