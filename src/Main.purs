module Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)
import Data.Maybe (Maybe(..))
import Data.List (List(..))
import Helpers (todo)

-- A list can be either:
-- Nil                        <- The empty list, there are no elements in this list
-- Cons element restOfTheList <- `element` is the first element of the list, the `restOfTheList` is
-- in turn also a list:
--
-- Remember that `restOfTheList` can be `Nil`
-- Cons element (Cons nextElement (Cons nextElementAfterThat Nil))

-- | Find the first element of a list, maybe returning a result depending on whether or not there
-- | is one element or more in the list.
first :: forall a. List a -> Maybe a -- Maybe can be either `Nothing` or `Just something`
first Nil = Nothing
first (Cons x _) = Just x
-- `_` means we do not care what is being matched, because we don't need it
-- We've used pattern matching, which is a way of saying:
-- "When we get input with this form, this function behaves this way."
-- In this case we're saying that if the list is `Nil` (empty), we return nothing, because
-- there can be no first element in an empty list.
--
-- If the list instead has at least one element (`x` and some *rest of the list*)
-- we return `Just x`, which is the `Maybe` version of having something.
--

-- | Find the second element of a list, maybe returning a result depending on whether or not there
-- | are two elements or more in the list.
second :: forall a. List a -> Maybe a
second = todo "second"

-- | Find the last element of a list, maybe returning a result depending on whether or not there
-- | is one element or more in the list.
last :: forall a. List a -> Maybe a
last = todo "last"

-- | Find the second last element of a list, maybe returning a result depending on whether or not
-- | there are two or more elements in the list.
secondLast :: forall a. List a -> Maybe a
secondLast = todo "secondLast"

-- | Drop the N first elements of a list, returning only the remainder. If N is higher than the
-- | amount of elements in the list, just return the empty list.
-- | If N is a negative number, drop nothing.
drop :: forall a. Int -> List a -> List a
drop = todo "drop"

-- | Find the N'th element of a list, maybe returning a result depending on whether or not there
-- | are N or more elements in the list. If N is a negative number, return the first element.
nth :: forall a. Int -> List a -> Maybe a
nth = todo "nth"

-- | Execute a function from `a` to `b`, returning the list where this function is executed on
-- | each item in the list in order.
map :: forall a b. (a -> b) -> List a -> List b
map = todo "first"

-- | Sum the numbers in a list.
sum :: List Int -> Int
sum = todo "sum"

-- | Define a function that takes two arguments but always returns the first argument.
-- | `const 3 1 = 3`
const :: forall a b. a -> b -> a
const = todo "const"

-- | Define a function that always returns its one argument.
-- | `id 3 = 3`
id :: forall a. a -> a
id = todo "id"

-- | Find the number of elements of a list.
length :: forall a. List a -> Int
length = todo "length"

-- | Reverse a list.
reverse :: forall a. List a -> List a
reverse = todo "reverse"

-- | Find out whether or not a list is a palindrome.
isPalindrome :: forall a. Eq a => List a -> Boolean
isPalindrome = todo "isPalindrome"

-- | Flatten a list.
flatten :: forall a. List (List a) -> List a
flatten = todo "flatten"

-- | Remove consecutive duplicates in a list.
compress :: forall a. List a -> List a
compress = todo "compress"

-- | Duplicate the elements in a list.
duplicate :: forall a. List a -> List a
duplicate = todo "duplicate"

-- | Duplicate the elements of a list N times.
duplicateN :: forall a. Int -> List a -> List a
duplicateN = todo "duplicateN"

main :: Effect Unit
main = do
  log "Hello sailor!"
