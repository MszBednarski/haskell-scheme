module Main where
import Text.ParserCombinators.Parsec
hiding (spaces)
import Sustem.Environment

symbol :: Parser Char
symbol = oneOf "!#$%&|*+-/:<=>?@^_~"

main :: IO ()
main = do
	
