main :: IO ()
-- :cmd return (unlines [":r", "main"])
-- haskell is left associating!
main = do
    let pr x = putStrLn x
    let sqr x = x*x
    pr (show (sqr 5))
    return ()