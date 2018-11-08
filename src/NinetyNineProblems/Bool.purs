module NinetyNineProblems.Bool where

data Bool =
  True
  | False

-- | Create a function that takes a boolean value B. If the value is `True`,
-- | return `False` and if it's `False`, return `True`.
not :: Bool -> Bool
not True = False
not False = True

-- | Create a function that takes two boolean values A and B. If both are `True`
-- | return `True`, else return `False`.
and :: Bool -> Bool -> Bool
and True b = b
and _ _ = False

-- | Create a function that takes two boolean values A and B. If either is `True`
-- | return `True`, else return `False`.
or :: Bool -> Bool -> Bool
or False b = b
or _ _ = True

-- | Create a function that takes two boolean values A and B. If both are `True`,
-- | return `False`, otherwise return `True`.
nand :: Bool -> Bool -> Bool
nand True True = False
nand _ _ = False

-- | Create a function that takes two boolean values A and B. If only one of
-- | them is `True`, return `True`. If both are either `True` or `False`, return
-- | `False`.
xor :: Bool -> Bool -> Bool
xor True b = not b
xor b True = not b
xor False b = b