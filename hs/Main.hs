module Main where

import Point

main :: IO ()
main = do
  point <- newPoint 1.5 2.0
  printPoint point
  result <- pointLength point
  putStrLn $ "point length: " <> show result
