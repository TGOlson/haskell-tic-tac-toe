module Main where


import TicTacToe


main :: IO ()
main = do
  putStr "And the winner is: "
  print $ playTicTacToe ticTacToe
