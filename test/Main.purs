module Test.Main where

import Data.Foldable as PSFoldable
import Data.List (List)
import Data.List as PSList
import Effect (Effect)
import Effect.Console (log)
import Main ( map, first, second, last, secondLast, nth, drop, sum, const, id
            , reverse, isPalindrome, flatten)
import Prelude (Unit, discard, identity, show, ($), (+), (<>), (==), (&&))
import Prelude as P
import Test.QuickCheck (quickCheck, withHelp)

main :: Effect Unit
main = do
  -- first
  spectacularLog "Testing `first` on 100 lists"
  quickCheck $ \(xs :: List Int) ->
    withHelp (first xs == PSList.head xs)
    $ "Test failed:\nfirst " <> show xs <> "\nis not equal to\n" <> show (PSList.head xs)
    <> "\nInstead: " <> show (first xs)

  -- second
  spectacularLog "Testing `second` on 100 lists"
  quickCheck $ \(xs :: List Int) ->
    withHelp (second xs == PSList.head (PSList.drop 1 xs))
    $ "Test failed:\nsecond " <> show xs <> "\nis not equal to\n"
      <> show (PSList.head (PSList.drop 1 xs))
      <> "\nInstead: " <> show (second xs)

  -- last
  spectacularLog "Testing `last` on 100 lists"
  quickCheck $ \(xs :: List Int) ->
    withHelp (last xs == PSList.last xs)
    $ "Test failed:\nlast " <> show xs
    <> "\nis not equal to\n" <> show (PSList.last xs)
    <> "\nInstead: " <> show (last xs)

  -- secondLast
  spectacularLog "Testing `secondLast` on 100 lists"
  quickCheck $ \(xs :: List Int) ->
    withHelp (secondLast xs == PSList.head (PSList.drop 1 (PSList.reverse xs)))
    $ "Test failed:\nsecondLast " <> show xs <> "\n!=\n"
    <> show (PSList.head (PSList.drop 1 (PSList.reverse xs)))
    <> "Instead:\n" <> show (secondLast xs)

  -- drop
  spectacularLog "Testing `drop` on 100 lists"
  quickCheck $ \n (xs :: List Int) ->
    withHelp (drop n xs == PSList.drop n xs)
    $ "Test failed: drop " <> show n <> " " <> "show xs"
    <> "\nis not equal to " <> show (PSList.drop n xs)
    <> "\nInstead: " <> show (drop n xs)

  -- nth
  spectacularLog "Testing `nth` on 100 lists"
  quickCheck $ \n (xs :: List Int) ->
    withHelp (nth n xs == PSList.head (PSList.drop n xs)) $
      "Test failed:\nnth " <> show n <> " " <> show xs
      <> "\nis not equal to\n"
      <> show (PSList.head (PSList.drop n xs))
      <> "\nInstead: " <> show (nth n xs)

  -- map
  spectacularLog "Testing `map` on 100 lists"
  quickCheck $ \(xs :: List Int) ->
    withHelp (map identity xs == xs) $
      "Test failed:\nmap identity " <> show xs <> "\n" <> "List should be the same as before."
  quickCheck $ \(xs :: List Int) ->
    withHelp (map (_ + 1) xs == P.map (_ + 1) xs)
    $ "Test failed:\nmap (_ + 1) " <> show xs <> "\nis not equal to\n"
    <> show (P.map (_ + 1) xs)
    <> "\nInstead: " <> show (map (_ + 1) xs)

  -- sum
  spectacularLog "Testing `sum` on 100 lists"
  quickCheck $ \(xs :: List Int) ->
    withHelp (sum xs == PSFoldable.sum xs) $
      "Test failed:\nsum " <> show xs <> "\nis not equal to\n" <> show (PSFoldable.sum xs)

  -- const
  spectacularLog "Testing `const` with 100 values"
  quickCheck $ \(n :: String) ->
    withHelp (const 3 n == 3) $
      "Test failed:\nconst 3" <> show n <> "\nis not equal to\n3\nInstead: " <> show (const 3 n)

  -- id
  spectacularLog "Testing `id` with 100 values"
  quickCheck $ \(n :: String) ->
    withHelp (id n == n) $
      "Test failed:\nid " <> show n <> "\nis not equal to\n" <> show n <> "\nInstead: " <> show (id n)

  -- reverse
  spectacularLog "Testing `reverse` with 100 lists"
  quickCheck $ \(xs :: List Int) ->
    withHelp (reverse xs == PSList.reverse xs)
    $ "Test failed:\nreverse " <> show xs
    <> "\nis not equal to\n"
    <> show (PSList.reverse xs)
    <> "\nInstead: " <> show (reverse xs)

  -- isPalindrome 1
  spectacularLog "Testing `isPalindrome` with 100 lists"
  quickCheck $ \(xs :: List Int) x ->
    withHelp ((isPalindrome (xs <> PSList.singleton x <> (PSList.reverse xs)) == true)
              && (isPalindrome (xs <> (reverse xs)) == true))
    $ "Test failed:\nisPalindrome " <> show xs
    <> "\nis not returning true"

  -- isPalindrome 2
  spectacularLog "Testing `isPalindrome` again with 100 lists"
  quickCheck $ \(xs :: List Int) ->
    withHelp (isPalindrome xs == (xs == PSList.reverse xs))
    $ "Test failed:\nisPalindrome " <> show xs
    <> "\nis not equal to\n"
    <> show (xs == PSList.reverse xs)
    <> "\nInstead: " <> show (isPalindrome xs)

  -- flatten
  spectacularLog "Testing `flatten` with 100 lists"
  quickCheck $ \(xs :: List (List Int)) ->
    withHelp (flatten xs == P.join xs)
    $ "Test failed:\nflatten " <> show xs
    <> "\nis not equal to\n"
    <> show (P.join xs)
    <> "\nInstead: " <> show (flatten xs)

spectacularLog :: String -> Effect Unit
spectacularLog text =
  log ("\n=============================\n"
       <> text
       <> "\n=============================\n")
