module NinetyNineProblems.Maybe where

import NinetyNineProblems.Helpers (undefined)
import Prelude (otherwise, (/), (>), (==), class Show, class Eq, show, (<>))

-- | A Maybe can be either `Nothing` or `Just something`, where `Nothing`
-- | represents the absence of something, perhaps a failure to produce a result.
data Maybe a =
  Just a
  | Nothing

isNothing :: forall a. Maybe a -> Boolean
isNothing (Just _) = false
isNothing Nothing = true

-- | Return `true` when a `Maybe` is `Just something` and `false` when it's
-- | `Nothing`.
isJust :: forall a. Maybe a -> Boolean
isJust = undefined

-- | Return `something` when a `Maybe` is `Just something` and another value
-- | of the same type when it's `Nothing`.
-- | `fromMaybe 42 (Just 5) = 5`
-- | `fromMaybe 42 Nothing = 42`
fromMaybe :: forall a. a -> Maybe a -> a
fromMaybe = undefined

-- | Modify the `something` inside a `Maybe` when it's there via a function F;
-- | otherwise return `Nothing`.
-- | `mapMaybe (_ + 42) (Just 3) = Just 45`
-- | `mapMaybe (_ + 42) Nothing = Nothing`
maybe :: forall a b. (a -> b) -> Maybe a -> Maybe b
maybe = undefined

-- | Return the result of dividing two numbers A and B, returning `Nothing` if
-- | b is equal to 0. Note that because this is integer division results will
-- | not be returning fractions.
-- | `divide 10 2 = Just 5`
-- | `divide 1 2 = Just 0`
-- | `divide 10 0 = Nothing`
divide :: Int -> Int -> Maybe Int
divide = undefined

--------------------------------------------------------------------------------
instance showMaybe :: Show a => Show (Maybe a) where
  show (Just a) = "Just " <> show a
  show Nothing = "Nothing"

instance eqMaybe :: Eq a => Eq (Maybe a) where
  eq Nothing Nothing = true
  eq (Just a) (Just b) = a == b
  eq _ _ = false
--------------------------------------------------------------------------------