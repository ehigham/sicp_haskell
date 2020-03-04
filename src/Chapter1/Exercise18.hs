module Chapter1.Exercise18 (fastMult) where
-- | Using the results of exercises 1.16 and 1.17, devise a procedure that
-- | generates an iterative process for multiplying two integers in terms of
-- | adding, doubling and halving and uses a logarithmic number of steps.
    
    fastMult :: (Real x, Integral x) => x -> x -> x
    fastMult = go 0
        where
            go acc a b
                | b == 0 = acc
                | even b = go acc (double a) (halve b)
                | otherwise = go (acc + a) a (b - 1)
            double x = x + x
            halve x = x `div` 2