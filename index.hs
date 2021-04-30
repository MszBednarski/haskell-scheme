main :: IO ()
double, quad :: Num a => a -> a
-- :cmd return (unlines [":r", "main"])
-- haskell is left associating!
-- factorial x = if x == 1 || x == 0 then 1 else factorial (x-1)*x
quad x = x^4
double x = 2*x
min a b = if a < b then a else b
max a b = if a > b then a else b
fib x
    | x > 1 = fib (x-1) + fib(x-2)
    | x <= 1 = 1

induction base comb n 
    | n==0 = base
    | n>0 = comb n (induction base comb (n-1))

factorial n = (induction 1 (*) n)

main = do
    let ps x = putStrLn x
    let pi x = putStrLn $ show x
    pi $ quad 5.0
    pi $ double 5
    pi $ double 5.5
    pi $ Main.max 5 4
    pi $ Main.min 4 5
    pi $ fib 2
    pi $ fib 3
    pi $ fib 4
    pi $ fib 5
    pi $ fib 6
    let res = factorial 4
    return ()