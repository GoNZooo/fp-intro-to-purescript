module NinetyNineProblems.List where

import Prelude (class Eq, (+), (<>))
import Data.Maybe (Maybe(..))
import Data.List (List(..), (:))
import NinetyNineProblems.Helpers (undefined)

-- A list can be either:
-- The empty list, there are no elements in this list: `Nil` 
-- An element linked to the rest of the list: `element : restOfTheList`
--
-- Remember that `restOfTheList` can be `Nil`
-- element : (nextElement : (nextElementAfterThat : Nil))

-- | Return the first element (the head) of a list, maybe returning a result
-- | depending on whether or not there is one element or more in the list.
head :: forall a. List a -> Maybe a
head Nil = Nothing
head (x : _) = Just x

-- | Return everything except the head of the list (the tail), maybe returning
-- | a result depending on whether or not there are any elements in the list.
tail :: forall a. List a -> Maybe (List a)
tail Nil = Nothing
tail (_ : xs) = Just xs

-- `_` means we do not care what is being matched, because we don't need it
-- We've used pattern matching, which is a way of saying:
-- "When we get input with this form, this function behaves this way."
-- In this case we're saying that if the list is `Nil` (empty), we return
-- nothing, because there can be no first element in an empty list.
--
-- If the list instead has at least one element (`x` and some rest of the list)
-- we return `Just x`, which is the `Maybe` version of having something.
--

-- | Find the second element of a list, maybe returning a result depending on
-- | whether or not there are two elements or more in the list.
second :: forall a. List a -> Maybe a
second = undefined

-- | Find the last element of a list, maybe returning a result depending on
-- | whether or not there is one element or more in the list.
last :: forall a. List a -> Maybe a
last = undefined

-- | Find the second last element of a list, maybe returning a result
-- | depending on whether or not there are two or more elements in the list.
secondLast :: forall a. List a -> Maybe a
secondLast = undefined

-- | Drop the N first elements of a list, returning only the remainder. If N
-- | is higher than the amount of elements in the list, just return the empty
-- | list. If N is a negative number, drop nothing.
drop :: forall a. Int -> List a -> List a
drop = undefined

-- | Find the N'th element of a list, maybe returning a result depending on
-- | whether or not there are N or more elements in the list. If N is a
-- | negative number, return the first element.
nth :: forall a. Int -> List a -> Maybe a
nth = undefined

-- | Execute a function from `a` to `b`, returning the list where this function
-- | is executed on each item in the list in order.
map :: forall a b. (a -> b) -> List a -> List b
map = undefined

-- | Sum the numbers in a list.
sum :: List Int -> Int
sum = undefined

-- | Define a function that takes two arguments but always returns the first
-- | argument: `const 3 1 = 3`
const :: forall a b. a -> b -> a
const = undefined

-- | Define a function that always returns its one argument.
-- | `id 3 = 3`
id :: forall a. a -> a
id = undefined

-- | Find the number of elements of a list.
length :: forall a. List a -> Int
length = undefined

-- | Reverse a list.
reverse :: forall a. List a -> List a
reverse = undefined

-- | Find out whether or not a list is a palindrome.
isPalindrome :: forall a. Eq a => List a -> Boolean
isPalindrome = undefined

-- | Flatten a list.
flatten :: forall a. List (List a) -> List a
flatten = undefined

-- | Remove consecutive duplicates in a list.
compress :: forall a. List a -> List a
compress = undefined

-- | Duplicate the elements in a list.
duplicate :: forall a. List a -> List a
duplicate = undefined

-- | Duplicate the elements of a list N times.
duplicateN :: forall a. Int -> List a -> List a
duplicateN = undefined

