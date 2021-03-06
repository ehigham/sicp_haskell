module Chapter2.Exercise36 (accumulateN) where

-- | The procedure `accumulateN` is similar to `accumulate` except it takes as
-- its thrird argument a sequence of sequences, which are all assumed to have
-- the same number of elements. It applies the designated accumulation procedure
-- to combine all the first elements of the sequences, all the second elements
-- of the sequences and so on and returns a sequence of the results. For
-- instance, is `s` is the sequence containing four sequences
-- @
--   s = [[1..3], [4..6], [7..9], [10..12]]
-- @
-- then the value of `accumulateN (+) 0 s` should be `[22, 26, 30]`.

-- note: can use `transpose` from `Data.List`
accumulateN :: (a -> b -> b) -> b -> [[a]] -> [b]
accumulateN f s = go
  where
    go [] = []
    go xs | any null xs = []
          | otherwise   = foldr (f . head) s xs : go (map tail xs)
