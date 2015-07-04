module Main where


import TicTacToe


main :: IO ()
main = do
  winner <- playTicTacToe ticTacToe
  putStr "And the winner is: "
  print winner
