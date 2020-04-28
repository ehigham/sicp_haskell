module Chapter2.Exercise9 () where
-- | The `width` of an interval is half the difference between its upper and
-- | lower bounds. The width is a measure of the uncertainty of the number
-- | specified by the interval.
-- | For some arithmetic operations, the width of the result of combining two
-- | intervals is a function only of the argument intervals, whereas for others
-- | the width of the computation is not a function of the widths of the
-- | argument intervals. Show that the width of the sum (or difference) of two
-- | intervals is a function only of the widths of the intervals being added
-- | (or subtracted).
--
-- | For (+)
-- @
--      width $ a + b
--      width $ mkInterval (lower a + lower b) (upper a + upper b)
--      abs . halve $ (upper a + upper b) - (lower a + lower b)
--      abs . halve $ (upper a - lower a) + (upper b + lower b)
--      abs . halve $ 2 * width a + 2 * width b
--      -- only a function of width!
-- @
--
-- | Give examples to show that this is not true of multiplication and division.
-- | If multiplication and division were only functions of interval width, then
-- | one would expect multiplying different intervals of the saem width would
-- | yield the same result. For example, consider multiplying width 5 intervals
-- | with width 1:
-- |  [0, 10] * [0, 2]  = [0, 20]   (width = 10)
-- |  [-5, 5] * [-1, 1] = [-5, 5]   (width = 5)
