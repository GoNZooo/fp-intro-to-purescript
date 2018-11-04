module NinetyNineProblems.Simple where

import Data.Int (even)
import NinetyNineProblems.Helpers (undefined)
import Prelude (gcd, negate, otherwise, (*), (+), (-), (<<<), (==), (>), (>=))

-- | Return the addition of two numbers A and B.
-- | The type signature (after `::`) says that we take an integer as a first
-- | and second argument. The thing after the last arrow says what the function
-- | returns. In this case, we return an integer value.
add :: Int -> Int -> Int
add a b = a + b

-- | Note that putting parenthesis around our operator (+) allows us to use it
-- | as a normal function, making it exactly equal to `add`.
add' :: Int -> Int -> Int
add' a b = (+) a b

-- | Here we take advantage of the fact that these definitions are exactly the
-- | same and we can now drop the arguments entirely, simply saying that
-- | `addAgain''` is equal to `(+)`.
addAgain :: Int -> Int -> Int
addAgain = (+)

-- | We could also choose to use `add` as if it was an operator like `(+)`,
-- | by putting back-quotes around it. This allows us to use normal named
-- | functions between arguments.
addAgain' :: Int -> Int -> Int
addAgain' a b = a `add` b

-- | Return the sutraction of two numbers A and B.
subtract :: Int -> Int -> Int
subtract = undefined

-- | Return the product of two numbers A and B.
multiply :: Int -> Int -> Int
multiply = undefined

-- | Return the negation of a number A.
negation :: Int -> Int
negation = undefined

-- | Return the absolute value of a number.
absolute :: Int -> Int
absolute = undefined

-- | Return the subtraction of a number A and B, but where B is negated first.
subtractNegated :: Int -> Int -> Int
subtractNegated = undefined

-- | Sometimes we need to ask a question about a value before we can choose
-- | what to do with it. There are a few ways to do this, appropriate for
-- | different scenarios. Here is the simplest, but maybe least elegant:
sign :: Int -> Int
sign x = if x == 0 then 0 else
  if x > 0 then 1
    else -1

-- | Here is a more elegant version that allows us to specify a list of
-- | conditions and what the function will do when a condition is true, as
-- | well as a case for when none of the previous conditions hold true.
sign' :: Int -> Int
sign' x
  | x == 0    = 0
  | x > 0     = 1
  | otherwise = -1

-- | Here is a variant that does not work very well for this particular case,
-- | but works very well when one wants to run a function on a value and do
-- | a case analysis of the result.
sign'' :: Int -> Int
sign'' x =
  case x of
    y | y == 0 ->
      0
    y | y > 0 ->
      1
    y ->
      -1

-- | Here is a contrived but better example of where we want to do a case
-- | analysis on the result of something and bind the result to a name so that
-- | we can use it when going forward. It also displays how you handle cases
-- | where the returned value doesn't matter to you, if all previous cases
-- | are not matching.
multiplyWithEvenCommonDivisor :: Int -> Int
multiplyWithEvenCommonDivisor x =
  case gcd x 100 of
    -- We bind the result of `gcd x 100` to the name `divisor` and check
    -- whether or not it's even (`| even divisor`) and if it is, we return
    -- the product of `x` and `divisor` (`x * divisor`)
    divisor | even divisor ->
      x * divisor
    -- We aren't using the divisor here so we don't need to care about giving
    -- this case a name. Instead we use `_`, which means we don't care what the
    -- value is.
    _ ->
      x

-- | Apply a function F to a value A.
apply :: forall a b. (a -> b) -> a -> b
apply = undefined

-- | Apply a function F twice to a value A.
applyTwice :: forall a. (a -> a) -> a -> a
applyTwice = undefined

-- | Apply the function F after applying the function G to a value A.
applyFAndG :: forall a b c. (b -> c) -> (a -> b) -> a -> c
applyFAndG = undefined

-- | Return the subtraction of a Number A and B, but where the function F
-- | is run on the number B first.
subtractWithFunction :: Int -> Int -> (Int -> Int) -> Int 
subtractWithFunction = undefined
