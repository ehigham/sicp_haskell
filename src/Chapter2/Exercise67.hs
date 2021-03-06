module Chapter2.Exercise67
    (
        HLeaf (HLeaf, weight, symbols),
        HuffmanTree (Huffman),
        decode,
        sampleTree,
        hGet
    ) where

import Data.Foldable (toList)
import Data.Function (on)

import Chapter2.Exercise63 (Tree (Empty, Leaf, Node))
import Chapter2.Exercise65 (TreeSet)
import Chapter2.Set (fromList, union)

data HLeaf a = HLeaf { weight  :: Integer
                     , symbols :: TreeSet a
                     }
  deriving stock (Eq, Show)

instance (Eq a) => Ord (HLeaf a) where
    compare = compare `on` weight

newtype HuffmanTree a = Huffman { getTree :: Tree (HLeaf a) }
  deriving stock (Eq, Show)

instance (Eq a) => Ord (HuffmanTree a) where
    compare = compare `on` (hGet weight 0 . getTree )

instance (Ord a) => Semigroup (HuffmanTree a) where
    (Huffman a) <> (Huffman b) = Huffman $ Node a (HLeaf w s) b
      where
        w = hGet weight 0 a + hGet weight 0 b
        s = hGet symbols mempty a `union` hGet symbols mempty b

instance (Ord a) => Monoid (HuffmanTree a) where
    mempty = Huffman mempty

hGet :: (HLeaf a -> b) -> b -> Tree (HLeaf a) -> b
hGet _ d Empty        = d
hGet f _ (Leaf x)     = f x
hGet f _ (Node _ x _) = f x

decode ::  HuffmanTree a -> String -> [a]
decode (Huffman tree) = go tree . fmap next
  where
    go Empty  _    = []
    go _      []   = []
    go branch (f:fs) = case f branch of
        Leaf x -> (toList . symbols) x ++ go tree fs
        t      -> go t fs

    next '0' (Node l _ _) = l
    next '1' (Node _ _ r) = r
    next _            _   = error "bad input"

-- | Exercise 2.67
-- Define an encoding tree and a sample message and use `decode` to decode the
-- message

sampleTree :: HuffmanTree Char
sampleTree = Huffman (Leaf (HLeaf 4 (fromList "A")))
          <> Huffman (Leaf (HLeaf 2 (fromList "B")))
          <> Huffman (Leaf (HLeaf 1 (fromList "D")))
          <> Huffman (Leaf (HLeaf 1 (fromList "C")))
-- >>> decode sampleTree "0110010101110"
-- "ADABBCA"
