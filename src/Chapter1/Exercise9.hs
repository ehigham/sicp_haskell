module Chapter1.Exercise9 (add', add'') where
-- | Each of the follwoing two procedures defines a method for adding two
-- positive integers in terms of the procedures `inc`, which increments
-- its argument by 1, and `dec`, which decrements its argument by 1.

add' :: Int -> Int -> Int
add' x y = if x == 0 then y else inc $ add' (dec x) y

add'' :: Int -> Int -> Int
add'' x y = if x == 0 then y else add'' (dec x) (inc y)

inc :: (Num x) => x -> x
inc = (+ 1)

dec :: (Num x) => x -> x
dec = subtract 1

-- | Using the substitution model, illustrate the process generated by each
-- procedure in evaluating (+ 4 5). Are these processes iterative or
-- recursive?
--
-- >>> add' 4 5
-- inc $ add' 3 5
-- inc $ inc $ add' 2 5
-- inc $ inc $ inc $ add' 1 5
-- inc $ inc $ inc $ inc $ add 0 5
-- inc $ inc $ inc $ inc $ 5
-- inc $ inc $ inc $ 6
-- inc $ inc $ 7
-- inc $ 8
-- 9
--
-- | `add'` follows a recursive process
--
-- >>> add'' 4 5
-- add'' 3 6
-- add'' 2 7
-- add'' 1 8
-- add'' 0 9
-- 9
--
-- | `add''` follows a linear process
