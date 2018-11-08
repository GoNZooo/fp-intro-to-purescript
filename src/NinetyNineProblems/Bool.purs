module NinetyNineProblems.Bool where

import Prelude (class Show)
import NinetyNineProblems.Helpers (undefined)

data Bool =
  True
  | False

-- | Create a function that takes a boolean value B. If the value is `True`,
-- | return `False` and if it's `False`, return `True`.
not :: Bool -> Bool
not = undefined

-- | Create a function that takes two boolean values A and B. If both are `True`
-- | return `True`, else return `False`.
and :: Bool -> Bool -> Bool
and = undefined

-- | Create a function that takes two boolean values A and B. If either is `True`
-- | return `True`, else return `False`.
or :: Bool -> Bool -> Bool
or = undefined

-- | Create a function that takes two boolean values A and B. If both are `True`,
-- | return `False`, otherwise return `True`.
nand :: Bool -> Bool -> Bool
nand = undefined

-- | Create a function that takes two boolean values A and B. If only one of
-- | them is `True`, return `True`. If both are either `True` or `False`, return
-- | `False`.
xor :: Bool -> Bool -> Bool
xor = undefined

--------------------------------------------------------------------------------
instance showBool :: Show Bool where
  show True = "True"
  show False = "False"
--------------------------------------------------------------------------------