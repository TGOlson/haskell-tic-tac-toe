module TicTacToe where

import GameEngine
import Board
import Player


data TicTacToe = TicTacToe (GameEngine [Symbol] (Int, Symbol))


type TicTacToeState = GameState [Symbol]


initialGameState :: TicTacToeState
initialGameState = GameState emptyBoard


getCurrentPlayer :: TicTacToeState -> Player
getCurrentPlayer (GameState xs) = if pXCount > pOCount then playerO else playerX
  where pXCount = length $ filter isPlayerXSymbol xs
        pOCount = length $ filter isPlayerOSymbol xs


getCurrentMoves :: TicTacToeState -> [Move (Int, Symbol)]
-- always move in the first position, for now
getCurrentMoves gameState = [Move (0, symbol)]
  where (Player symbol) = getCurrentPlayer gameState


makeMove :: TicTacToeState -> Move (Int, Symbol) -> TicTacToeState
makeMove (GameState (_:xs)) (Move (_, s)) = GameState (s:xs)


gameRules :: GameActions [Symbol] (Int, Symbol)
gameRules = GameActions {
    getPlayer = getCurrentPlayer,
    getMoves  = getCurrentMoves,
    getResult = makeMove,

    -- end game after each player moves once, for now
    isTerminal = \(GameState (x:_)) -> (x == 'O'),

    -- game is always a tie, for now
    getScore   = \_ _ -> 0
  }


ticTacToe :: TicTacToe
ticTacToe = TicTacToe $ GameEngine gameRules initialGameState


playTicTacToe :: TicTacToe -> Int
playTicTacToe (TicTacToe engine) = play engine
