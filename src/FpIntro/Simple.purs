-- | Programming is mostly about applying functions to values and getting some
-- | kind of result. We don't have to apply only one function to something, but
-- | can specify a series of functions to apply to a value, or sometimes apply
-- | one function *or* the other.
--
-- | In order to get familiar with how PureScript allows you to translate this
-- | concept into code, this module serves as an introduction to how one applies
-- | functions to values and how we specify a function's type, as well as how
-- | this affects things like not supplying every value to the function.
module FpIntro.Simple where

import Prelude hiding (add)

import Data.Int (even)
import Data.List (List)
import FpIntro.Helpers (undefined)

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
-- | `addAgain` is equal to `(+)`.
addAgain :: Int -> Int -> Int
addAgain = (+)

-- | We could also choose to use `add` as if it was an operator like `(+)`,
-- | by putting back-quotes around it. This allows us to use normal named
-- | functions between arguments.
addAgain' :: Int -> Int -> Int
addAgain' a b = a `add` b

-- | When we don't supply all arguments to a function we effectively get what
-- | is left of the type signature. An example:
-- | ```
-- | add5 6 = 11
-- | add :: Int -> Int -> Int
-- | add5 ::       Int -> Int
-- | ```
-- | Note the relation between us giving the first argument and in return
-- | getting a function representing the rest of the computation.
-- | Don't worry if this isn't immediately clear right away, as it's something
-- | you're likely to get familiar with fairly soon.
add5 :: Int -> Int
add5 = add 5

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

-- | Return whether or not the length of a string is even.
-- | Hint: Use `String.length` to get the length of a string.
stringLengthIsEven :: String -> Boolean
stringLengthIsEven = undefined

-- | Sometimes we need to ask a question about a value before we can choose
-- | what to do with it. There are a few ways to do this, appropriate for
-- | different scenarios. Here is the simplest, but maybe least elegant:
sign :: Int -> Int
sign x = if x == 0
  then 0
  else if x > 0
    then 1
    else -1

-- | Here is a more elegant version that allows us to specify a list of
-- | conditions and what the function will do when a condition is true, as
-- | well as a case for when none of the previous conditions hold true.
sign' :: Int -> Int
sign' x
  | x == 0 = 0
  | x > 0 = 1
  | otherwise = -1

-- | Here is a variant that does not work very well for this particular case,
-- | but works very well when one wants to run a function on a value and do
-- | a case analysis of the result.
sign'' :: Int -> Int
sign'' x = case x of
  y
    | y == 0 -> 0
  y
    | y > 0 -> 1
  y -> -1

-- | Define a function that takes two arguments but always returns the first
-- | argument:
-- | ```
-- | const 3 1 = 3
-- | ```
const :: forall a b. a -> b -> a
const = undefined

-- | Define a function that always returns its one argument.
-- | ```
-- | id 3 = 3
-- | ```
id :: forall a. a -> a
id = undefined

-- | Here is a contrived but better example of where we want to do a case
-- | analysis on the result of something and bind the result to a name so that
-- | we can use it when going forward. It also displays how you handle cases
-- | where the returned value doesn't matter to you, if all previous cases
-- | are not matching.
multiplyWithEvenCommonDivisor :: Int -> Int
multiplyWithEvenCommonDivisor x = case gcd x 100 of
  -- We bind the result of `gcd x 100` to the name `divisor` and check
  -- whether or not it's even (`| even divisor`) and if it is, we return
  divisor
    | even divisor -> x * divisor
  -- We aren't using the divisor here so we don't need to care about giving
  -- this case a name. Instead we use `_`, which means we don't care what the
  -- value is.
  _ -> x

-- | Return `true`/`false` based on whether or not an integer A is divisible by
-- | an integer B.
-- |
-- | Hint: `mod` can be used to return the remainder of an integer divided by
-- | another. An integer A is divisible by an integer B when dividing A by B
-- | gives a remainder of 0.
isDivisibleBy :: Int -> Int -> Boolean
isDivisibleBy = undefined

-- | "Anonymous functions" are very common in functional programming. There are
-- | several ways of creating them, but the principal most basic one is as
-- | follows:
-- | ```
-- | \x -> x + 1
-- | ```
-- | The above example shows how to create an anonymous function that takes an
-- | argument X and adds 1 to it.
-- | Define a function `isDivisibleBy2` only by binding the name to an anonymous
-- | function:
-- | ```
-- | isDivisibleBy2 = \i -> ...
-- | ```
isDivisibleBy2 :: Int -> Boolean
isDivisibleBy2 = undefined

-- We can create these functions anywhere that we would like and they are very
-- commonly used when we don't need to put a name on a function, because we use
-- it very rarely, perhaps only in one specific case, hence the name
-- "anonymous" function.
-- | Return `true`/`false` based on whether or not all integers in a list L are
-- | divisible by an integer A.
-- |
-- | Hint: `all` from `Data.List` can be used to check whether or not all items
-- | in a list return true for a given predicate.
-- | For lists, `all` looks as follows:
-- | ```
-- | (a -> Boolean) -> List a -> Boolean
-- | ```
-- | That is to say, it takes a predicate on an `a`, a list of `a`s and returns
-- | a boolean.
-- | In this instance, `a` is an integer, so our type will be:
-- | ```
-- | (Int -> Boolean) -> List Int -> Boolean
-- | ```
allDivisibleBy :: Int -> List Int -> Boolean
allDivisibleBy = undefined

-- | Return `true`/`false` based on whether or not any integer in a list L is
-- | divisible by an integer A.
-- |
-- | Hint: `Data.List.any` can be used to check whether or not all items in a
-- | list return true for a given predicate.
anyDivisibleBy :: Int -> List Int -> Boolean
anyDivisibleBy = undefined

-- | Apply a function F to a value A.
-- | When we write `(a -> b)` this denotes a function that takes an `a` and
-- | returns a `b`. The signature of this function says that `apply` is a
-- | function that takes a function from `a` to `b` and a value of type `a`
-- | and returns a value of type `b`.
apply :: forall a b. (a -> b) -> a -> b
apply = undefined

-- | Apply a function F twice to a value A.
applyTwice :: forall a. (a -> a) -> a -> a
applyTwice = undefined

-- | Apply a function F to a value A if a predicate P holds for the result.
applyIf :: forall a. (a -> a) -> (a -> Boolean) -> a -> a
applyIf = undefined

-- | Apply the function F after applying the function G to a value A.
-- | Try the following usage:
-- | ```
-- | > add5 = applyFAndG (_ + 3) (_ + 2)
-- | > add5 6
-- | ```
-- | What is the result?
-- | Note the type signature and that you've supplied both F and G, but nothing
-- | representing the value `a`.
-- | ```
-- | applyFAndG :: forall a b c. (b -> c) -> (a -> b) -> a -> c
-- | applyFAndG ::                   f    ->     g    -> (a -> c)
-- | ```
-- | What is returned when you *partially* apply a function like this is the
-- | rest of the type signature, in this case `a -> c` or `(a -> c)`, which
-- | represents a function that takes an `a` and returns a `c`. The returned
-- | result is therefore a function from `a` to `c`.
-- | This is a very common way to combine two or more functions in order to
-- | create a new one.
applyFAndG :: forall a b c. (b -> c) -> (a -> b) -> a -> c
applyFAndG = undefined

-- | Return the subtraction of a Number A and B, but where the function F
-- | is run on the number B first.
subtractWithFunction :: Int -> Int -> (Int -> Int) -> Int
subtractWithFunction = undefined
