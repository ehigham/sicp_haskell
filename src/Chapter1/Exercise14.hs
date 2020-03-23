module Chapter1.Exercise14 (countChange) where
-- | Draw the tree illustrating the process generated by the `countChange`
-- | procedure of section 1.2.2 in making change for 11 cents. What are the
-- | orders of growth of the space and number of steps used by this process
-- | as the amount to be changed increases?

    countChange :: Int -> Int
    countChange = cc 5

    cc :: Int -> Int -> Int
    cc kinds amount
        | amount == 0              = 1
        | amount < 0 || kinds == 0 = 0
        | otherwise                = cc (kinds - 1) amount
                                     + cc kinds (amount - firstDenomination kinds)

    firstDenomination :: Int -> Int
    firstDenomination kinds
        | kinds == 1 = 1
        | kinds == 2 = 5
        | kinds == 3 = 10
        | kinds == 4 = 25
        | otherwise = 50

-- >>> countChange 11
-- (cc 5 11)
--     | (cc 5 -39) -> 0
--     | (cc 4 11)
--           | (cc 4 -14) -> 0
--           | (cc 3 11)
--               | (cc 3 1)
--                   | (cc 3 -9) -> 0
--                   | (cc 2 1)
--                       | (cc 2 -4) -> 0
--                       | (cc 1 1)
--                           | (cc 0 1) -> 0
--                           | (cc 1 0) -> 1
--               | (cc 2 11)
--                   | (cc 2 6)
--                       | (cc 1 6)
--                           | (cc 0 6) -> 0
--                           | (cc 1 5)
--                               | (cc 0 5) -> 0
--                               | (cc 1 4)
--                                   | (cc 0 4) -> 0
--                                   | (cc 1 3)
--                                       | (cc 0 3) -> 0
--                                       | (cc 1 2)
--                                           | (cc 0 2) -> 0
--                                           | (cc 1 1)
--                                               | (cc 0 1) -> 0
--                                               | (cc 1 0) -> 1
--                       | (cc 2 1)
--                           | (cc 1 1)
--                               | (cc 0 1) -> 0
--                               | (cc 1 0) -> 1
--                           | (cc 2 -4) -> 0
--                   | (cc 1 11)
--                       | (cc 0 11) -> 0
--                       | (cc 1 10)
--                           | (cc 0 10) -> 0
--                           | (cc 1 9)
--                               | (cc 0 9) -> 0
--                               | (cc 1 8)
--                                   | (cc 0 8) -> 0
--                                   | (cc 1 7)
--                                       | (cc 0 7) -> 0
--                                       | (cc 1 6)
--                                           | (cc 0 6) -> 0
--                                           | (cc 1 5)
--                                               | (cc 0 5) -> 0
--                                               | (cc 1 4)
--                                                   | (cc 0 4) -> 0
--                                                   | (cc 1 3)
--                                                       | (cc 0 3) -> 0
--                                                       | (cc 1 2)
--                                                           | (cc 0 2) -> 0
--                                                           | (cc 1 1)
--                                                               | (cc 0 1) -> 0
--                                                               | (cc 1 0) -> 1
