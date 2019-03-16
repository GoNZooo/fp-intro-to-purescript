-- | Recursion is a central concept in functional programming and it represents
-- | breaking down a problem into a repeatable smaller step that, when performed
-- | several times will accomplish a bigger task.
-- |
-- | This module should serve as a small introduction to recursion and is meant
-- | to not tie this excessively into the idea of data and its internal
-- | structure.
module NinetyNineProblems.Recursion where

import NinetyNineProblems.Helpers (undefined)
import Prelude (not, otherwise, (*), (+), (-), (>))

-- | Apply a function F N times to a value A.
applyN ::
  forall a.
  Int ->
  (a -> a) ->
  a ->
  a
applyN = undefined

-- | Apply a function F to a value A while a predicate P holds for the result.
applyWhile ::
  forall a.
  (a -> a) ->
  (a -> Boolean) ->
  a ->
  a
applyWhile = undefined

-- | Apply a function F to a value A until a predicate P holds for the result.
applyUntil ::
  forall a.
  (a -> a) ->
  (a -> Boolean) ->
  a ->
  a
applyUntil = undefined

-- | Sum all the numbers up to and including an integer N, starting at 1.
-- | ```
-- | sumZeroToN 5 = 15
-- | ```
sumZeroToN ::
  Int ->
  Int
sumZeroToN = undefined

-- | Multiply all the numbers up to and including an integer N, starting at 1.
-- | ```
-- | multiplyOneToN 5 = 120
-- | ```
multiplyOneToN ::
  Int ->
  Int
multiplyOneToN = undefined
