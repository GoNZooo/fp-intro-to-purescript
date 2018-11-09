module NinetyNineProblems.ListTest where

import Data.Foldable as PSFoldable
import Data.List (List(..), (:), (..))
import Data.List as PSList
import Prelude (Unit, discard, identity, show, ($), (&&), (+), (-), (<>), (==),
               (<=), const, flip)
import Prelude as P
import Test.Spec.QuickCheck (quickCheck)
import Test.Spec (describe, it, Spec)
import Test.QuickCheck (withHelp)

import NinetyNineProblems.Maybe (Maybe(..))
import NinetyNineProblems.List

listSpec :: Spec Unit
listSpec = do
  describe "List" do
     describe "`head`" do
        it "returns the head of the list" do
         quickCheck $ \(x :: Int) (xs :: List Int) ->
           withHelp (head (x : xs) == Just x)
           $ "Test failed:\nhead " <> show xs <> "\nis not equal to\n" <> show (PSList.head xs)
           <> "\nInstead: " <> show (head xs)

     describe "`tail`" do
       it "returns the tail" do
         quickCheck $ \(x :: Int) (xs :: List Int) ->
           withHelp (tail (x : xs) == Just xs)
           $ "Test failed:\ntail " <> show xs <> "\nis not equal to\n" <> show (PSList.tail xs)
           <> "\nInstead: " <> show (tail xs)

     describe "`second`" do
       it "returns second element of list" do
         quickCheck $ \(x :: Int) (y :: Int) (xs :: List Int) ->
           withHelp (second (x : y : xs) == Just y)
           $ "Test failed:\nsecond " <> show xs <> "\nis not equal to\n"
           <> show (PSList.head (PSList.drop 1 xs))
           <> "\nInstead: " <> show (second xs)

     describe "`last`" do
       it "returns the last element" do
         quickCheck $ \(x :: Int) (xs :: List Int) ->
           withHelp (last (PSList.reverse (x : xs)) == Just x)
           $ "Test failed:\nlast " <> show xs
           <> "\nis not equal to\n" <> show (PSList.last xs)
           <> "\nInstead: " <> show (last xs)

     describe "`secondLast`" do
       it "returns the second to last element" do
         quickCheck $ \(x :: Int) (y :: Int) (xs :: List Int) ->
           withHelp (secondLast (PSList.reverse (x : y : xs)) == Just y)
           $ "Test failed:\nsecondLast " <> show xs
           <> "\nis not equal to\n"
           <> show (PSList.head (PSList.drop 1 (PSList.reverse xs)))
           <> "Instead:\n" <> show (secondLast xs)

     describe "`drop`" do
       it "drops the required amount of elements" do
         quickCheck $ \n (xs :: List Int) ->
           withHelp (drop n xs == PSList.drop n xs)
           $ "Test failed: drop " <> show n <> " " <> "show xs"
           <> "\nis not equal to " <> show (PSList.drop n xs)
           <> "\nInstead: " <> show (drop n xs)

     describe "`dropWhile`" do
       it "drops while predicate holds true" do
         quickCheck $ \(b :: Boolean) ->
         let p = (_ <= 9)
             xs = (1..10)
           in
           withHelp (dropWhile p xs == PSList.dropWhile p xs)
           $ "Test failed: dropWhile (_ <= 9) (1..10)"
           <> "\nis not equal to (10 : Nil)"
           <> "\nInstead: " <> show (dropWhile p xs)

       it "drops nothing on false" do
         quickCheck $ \(b :: Boolean) ->
         let p = const false
             xs = (1..10)
           in
           withHelp (dropWhile p xs == xs)
           $ "Test failed: dropWhile (const false) (1..10)"
           <> "\nis not equal to " <> show xs
           <> "\nInstead: " <> show (dropWhile p xs)

       it "drops everything on true" do
         quickCheck $ \(b :: Boolean) ->
         let p = const true
             xs = (1..10)
           in
           withHelp (dropWhile p xs == Nil)
           $ "Test failed: dropWhile (const true) (1..10)"
           <> "\nis not equal to Nil"
           <> "\nInstead: " <> show (dropWhile p xs)

     describe "`nth`" do
       it "returns the element at position N" do
         quickCheck $ \n (xs :: List Int) ->
           let
             getAnswer :: forall a. Int -> List a -> Maybe a
             getAnswer _ Nil = Nothing
             getAnswer n' (x : xs') = getAnswer (n' - 1) xs'
           in
           withHelp (nth n xs == getAnswer n xs)
           $ "Test failed:\nnth " <> show n <> " " <> show xs
           <> "\nis not equal to\n"
           <> show (PSList.head (PSList.drop n xs))
           <> "\nInstead: " <> show (nth n xs)

     describe "`foldr`" do
       it "returns the same list on `foldr (:) xs`" do
         quickCheck $ \(xs :: List Int) ->
           withHelp (foldr (:) Nil xs == xs)
           $ "Test failed:\nfoldr (:) Nil" <> show xs
           <> "\n" <> "List should be the same as before."

     describe "`foldl`" do
       it "reverses the list when using flipped `:`" do
         quickCheck $ \(xs :: List Int) ->
           withHelp (foldl (flip (:)) Nil xs == PSList.reverse xs)
           $ "Test failed:\nfoldl (:) Nil" <> show xs
           <> "\n" <> "List should be the same as before."

     describe "`map`" do
       it "returns the same list on `map identity xs`" do
         quickCheck $ \(xs :: List Int) ->
           withHelp (map identity xs == xs)
           $ "Test failed:\nmap identity " <> show xs
           <> "\n" <> "List should be the same as before."

       it "maps `(_ + 1) over the list correctly`" do
         quickCheck $ \(xs :: List Int) ->
           withHelp (map (_ + 1) xs == P.map (_ + 1) xs)
           $ "Test failed:\nmap (_ + 1) " <> show xs <> "\nis not equal to\n"
           <> show (P.map (_ + 1) xs)
           <> "\nInstead: " <> show (map (_ + 1) xs)

     describe "`sum`" do
       it "has `sum`" do
         quickCheck $ \(xs :: List Int) ->
           withHelp (sum xs == PSFoldable.sum xs)
           $ "Test failed:\nsum " <> show xs
           <> "\nis not equal to\n" <> show (PSFoldable.sum xs)

     describe "`length`" do
       it "returns correct length" do
         quickCheck $ \(xs :: List Boolean) ->
           withHelp (length xs == PSList.length xs)
           $ "Test failed:\nlength " <> show xs
           <> "\nis not equal to\n" <> show (PSList.length xs)

     describe "`append`" do
       it "appends two lists" do
         quickCheck $ \(xs :: List Int) (ys :: List Int) ->
           withHelp (append xs ys == xs <> ys)
           $ "Test failed:\nappend " <> show xs <> " " <> show ys
           <> "\nis not equal to\n" <> show (xs <> ys)

     describe "`reverse`" do
       it "has `reverse`" do
         quickCheck $ \(xs :: List Int) ->
           withHelp (reverse xs == PSList.reverse xs)
           $ "Test failed:\nreverse " <> show xs
           <> "\nis not equal to\n"
           <> show (PSList.reverse xs)
           <> "\nInstead: " <> show (reverse xs)

     describe "`isPalindrome`" do
       it "has `isPalindrome`" do
        quickCheck $ \(xs :: List Int) x ->
          withHelp ((isPalindrome (xs <> PSList.singleton x <> (PSList.reverse xs)) == true)
          && (isPalindrome (xs <> (reverse xs)) == true))
          $ "Test failed:\nisPalindrome " <> show xs
          <> "\nis not returning true"
        quickCheck $ \(xs :: List Int) ->
          withHelp (isPalindrome xs == (xs == PSList.reverse xs))
          $ "Test failed:\nisPalindrome " <> show xs
          <> "\nis not equal to\n"
          <> show (xs == PSList.reverse xs)
          <> "\nInstead: " <> show (isPalindrome xs)

     describe "`flatten`" do
       it "flattens" do
         quickCheck $ \(xs :: List (List Int)) ->
           withHelp (flatten xs == P.join xs)
           $ "Test failed:\nflatten " <> show xs
           <> "\nis not equal to\n"
           <> show (P.join xs)
           <> "\nInstead: " <> show (flatten xs)
