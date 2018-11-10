-- | Lists are a central data structure in functional programming and serve as
-- | the main abstraction for collections of things. Many languages have more
-- | types than lists, but for the most part they all relate to lists in some way.
-- |
-- | Lists can only contain items of the same type, so you might have the
-- | following types of list:
-- | ```
-- | List Int             -- A list of integer values
-- | List Boolean         -- A list of boolean values
-- | List MyDataStructure -- A list of our own custom values
-- | ```
-- |
-- | A list can be either:
-- | The empty list, there are no elements in this list: `Nil` 
-- | An element linked to the rest of the list: `element : restOfTheList`
--
-- | Remember that `restOfTheList` can be `Nil`
-- | element : (nextElement : (nextElementAfterThat : Nil))

module NinetyNineProblems.List where

import NinetyNineProblems.Maybe

import Data.List (List(..), (:))
import NinetyNineProblems.Helpers (undefined)
import Prelude (class Eq, const, otherwise, (+), (-), (<<<), (<=), (<>), (==), (>), (>=))

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

-- | Drop elements from the start of a list until a predicate P no longer holds
-- | true.
-- | `dropWhile (_ < 9) (1..10) = (9 : 10 : Nil)`
dropWhile :: forall a. (a -> Boolean) -> List a -> List a
dropWhile = undefined

-- | Find the N'th element of a list, maybe returning a result depending on
-- | whether or not there are N or more elements in the list. If N is a
-- | negative number, or bigger than the length of the list, return `Nothing`.
nth :: forall a. Int -> List a -> Maybe a
nth = undefined

-- | Execute a function from `a` to `b`, returning the list where this function
-- | is executed on each item in the list in order.
map :: forall a b. (a -> b) -> List a -> List b
map = undefined

-- | Sum the numbers in a list.
sum :: List Int -> Int
sum = undefined

-- | Find the number of elements of a list.
length :: forall a. List a -> Int
length = undefined

-- | Append a list XS to a list YS and return a new list where all the elements
-- | of XS are immediately followed by the entire list YS.
append :: forall a. List a -> List a -> List a
append = undefined

-- | Reverse a list.
reverse :: forall a. List a -> List a
reverse = undefined

-- | Return a list with the same element A repeated N times.
-- | ```
-- | replicate 3 "ha" = ("ha" : "ha" : "ha" : Nil)
-- | ```
replicate :: forall a. Int -> a -> List a
replicate = undefined

foldr :: forall a b. (a -> b -> b) -> b -> List a -> b
foldr = undefined

foldl :: forall a b. (b -> a -> b) -> b -> List a -> b
foldl = undefined

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