module NinetyNineProblems.Maybe where

import Data.Maybe (Maybe(..))
import NinetyNineProblems.Helpers (undefined)
import Prelude (otherwise, (/), (>), (==))

-- A Maybe can be either `Nothing` or `Just something`, where `Nothing` represents the
-- absence of something, perhaps a failure to produce a result.

isNothing :: forall a. Maybe a -> Boolean
isNothing (Just _) = false
isNothing Nothing = true

-- | Return `true` when a `Maybe` is `Just something` and `false` when it's
-- | `Nothing`.
isJust :: forall a. Maybe a -> Boolean
isJust = undefined

-- | Return `something` when a `Maybe` is `Just something` and another value
-- | of the same type when it's `Nothing`.
maybe :: forall a. a -> Maybe a -> a
maybe = undefined

-- | Return the result of dividing two numbers A and B, returning `Nothing` if
-- | b is equal to 0. Note that because this is integer division results will
-- | not be returning fractions.
-- | `divide 10 2 = Just 5`
-- | `divide 1 2 = Just 0`
-- | `divide 10 0 = Nothing`
divide :: Int -> Int -> Maybe Int
divide = undefined
