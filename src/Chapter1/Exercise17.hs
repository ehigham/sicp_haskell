module Chapter1.Exercise17 (mult, fastMult) where
-- | The exponentiation algorithms in this section are based on performing
-- | exponentiation by means of repeated multiplication. In a similiar way, one
-- | can perform integer multiplication by means of repeated addition. The
-- | following multiplication procedure is analagous to the exp procedureL

    mult :: (Real x) => x -> x -> x
    mult a b
        | b == 0 = 0
        | otherwise = a + mult a (b - 1)

-- | This algorithm takes a umber of steps that is linear in b. Now suppose
-- | we include, together with addition, the operations `double` (which
-- | doubles an integer) and `halve` which divides an even integer by two.
-- | Using these, design a multiplication procedure analogous to `fastExpt`
-- | that uses a logarithmic number of steps.

    fastMult :: (Real x, Integral x) => x -> x -> x
    fastMult = go 0
        where
            go acc a b
                | b == 0 = acc
                | even b = go acc (double a) (halve b)
                | otherwise = go (acc + a) a (b - 1)
            double x = x + x
            halve x = x `div` 2