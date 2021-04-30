main :: IO ()
-- up to week 6
-- double, quad :: Num a => a -> a
-- :cmd return (unlines [":r", "main"])
-- haskell is left associating!
-- factorial x = if x == 1 || x == 0 then 1 else factorial (x-1)*x
-- quad x = x^4
-- double x = 2*x
-- min a b = if a < b then a else b
-- max a b = if a > b then a else b
-- fib x
--     | x > 1 = fib (x-1) + fib(x-2)
--     | x <= 1 = 1

-- induction base comb n 
--     | n==0 = base
--     | n>0 = comb n (induction base comb (n-1))

-- factorial n = (induction 1 (*) n)

-- week 7
-- apply :: (a -> b) -> a -> b
-- apply f x = f x
-- add7 x = "Asef"

-- roots (a,b,c)
--     | a == 0 = error "not quadratic equation"
--     | (d < 0) = error "complex roots"
--     | otherwise = ((-b-r))
--     where {
--     d = b*b - 4*a*c;
--     r = sqrt d;
--     e = 2*a }

-- cartProd :: [a] -> [b] -> [(a,b)]
-- cartProd xs ys = [(x,y) | x <- xs, y <- ys]



main = do
    let ps x = putStrLn x
    let pi x = putStrLn $ show x

    return ()