module Main where

import Add

main :: IO ()
main = do
  result <- add 5 7
  putStrLn $ "5 + 7 = " ++ show result
