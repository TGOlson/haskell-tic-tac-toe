module Player where

import GameEngine


playerX :: Player
playerX = Player 'X'


playerO :: Player
playerO = Player 'O'


-- workaround since the Player data type is not an instance of eq
isPlayer :: Player -> Player -> Bool
isPlayer (Player a) (Player b) = a == b


isPlayerSymbol :: Player -> Symbol -> Bool
isPlayerSymbol (Player x) = (==) x


isPlayerXSymbol :: Symbol -> Bool
isPlayerXSymbol = isPlayerSymbol playerX


isPlayerOSymbol :: Symbol -> Bool
isPlayerOSymbol = isPlayerSymbol playerO
