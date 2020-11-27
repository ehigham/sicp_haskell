module Chapter2.TExercise65 (tests) where

import Chapter2.Exercise63 (fromList, Tree (Empty))
import Chapter2.Set
import Test.HUnit

set :: [Int] -> Tree Int
set = fromList

tests :: Test
tests = TestList [
    TestLabel "Adjoin"       $ TestList [
        TestLabel "Empty-Set"    $ set [1]    ~=? adjoin 1 Empty,
        TestLabel "Not-Contains" $ set [1..5] ~=? adjoin 3 (set [1,2,4,5]),
        TestLabel "Contains"     $ set [1..5] ~=? adjoin 1 (set [1..5])
        ],
    TestLabel "isElem"       $ TestList [
        TestCase (assertBool "Empty-Set"    (not $ isElem 1 (set []))),
        TestCase (assertBool "Not-Contains" (isElem 1 (set [1..5]))),
        TestCase (assertBool "Contains"     (not $ isElem 9 (set [1..8])))
        ],
    TestLabel "Intersection" $ TestList [
        Empty      ~=? intersect Empty (set [1..10]),
        Empty      ~=? intersect (set [1..10]) Empty,
        set [3, 5] ~=? intersect (set [1..5]) (set [3, 5..9])
        ],
    TestLabel "Union"        $ TestList [
        let x = set [1..10] in x ~=? union x Empty,
        let x = set [1..10] in x ~=? union Empty x,
        set [1..10] ~=? union (set [2,4..10]) (set [1,3..9])
        ]
    ]


