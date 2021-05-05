-- fuck yes ima build scheme in haskell
-- https://en.wikibooks.org/wiki/Write_Yourself_a_Scheme_in_48_Hours
-- go
-- :cmd return (unlines [":r", "main"])
module Main where
import System.Environment

main :: IO() 
main = do
	putStrLn ("Tell me ur name")
	line <- getLine
	putStrLn ("Hello, " ++ line) 
