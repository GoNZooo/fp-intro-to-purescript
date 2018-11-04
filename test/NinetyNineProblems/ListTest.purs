module NinetyNineProblems.ListTest where

import Data.Foldable as PSFoldable
import Data.List (List)
import Data.List as PSList
import Prelude (Unit, discard, identity, show, ($), (&&), (+), (<>), (==))
import Prelude as P
import Test.Spec.QuickCheck (quickCheck)
import Test.Spec (describe, it, Spec)
import Test.QuickCheck (withHelp)

import NinetyNineProblems.List

listSpec :: Spec Unit
listSpec = do
  describe "List" do
     describe "`head`" do
        it "returns the head of the list" do
         quickCheck $ \(xs :: List Int) ->
           withHelp (head xs == PSList.head xs)
           $ "Test failed:\nhead " <> show xs <> "\nis not equal to\n" <> show (PSList.head xs)
           <> "\nInstead: " <> show (head xs)

     describe "`tail`" do
       it "returns the tail" do
         quickCheck $ \(xs :: List Int) ->
           withHelp (tail xs == PSList.tail xs)
           $ "Test failed:\ntail " <> show xs <> "\nis not equal to\n" <> show (PSList.tail xs)
           <> "\nInstead: " <> show (tail xs)

     describe "`second`" do
       it "returns second element of list" do
         quickCheck $ \(xs :: List Int) ->
           withHelp (second xs == PSList.head (PSList.drop 1 xs))
           $ "Test failed:\nsecond " <> show xs <> "\nis not equal to\n"
           <> show (PSList.head (PSList.drop 1 xs))
           <> "\nInstead: " <> show (second xs)

     describe "`last`" do
       it "returns the last element" do
         quickCheck $ \(xs :: List Int) ->
           withHelp (last xs == PSList.last xs)
           $ "Test failed:\nlast " <> show xs
           <> "\nis not equal to\n" <> show (PSList.last xs)
           <> "\nInstead: " <> show (last xs)

     describe "`secondLast`" do
       it "returns the second to last element" do
         quickCheck $ \(xs :: List Int) ->
           withHelp (secondLast xs == PSList.head (PSList.drop 1 (PSList.reverse xs)))
           $ "Test failed:\nsecondLast " <> show xs <> "\n!=\n"
           <> show (PSList.head (PSList.drop 1 (PSList.reverse xs)))
           <> "Instead:\n" <> show (secondLast xs)

     describe "`drop`" do
       it "drops the required amount of elements" do
         quickCheck $ \n (xs :: List Int) ->
           withHelp (drop n xs == PSList.drop n xs)
           $ "Test failed: drop " <> show n <> " " <> "show xs"
           <> "\nis not equal to " <> show (PSList.drop n xs)
           <> "\nInstead: " <> show (drop n xs)

     describe "`nth`" do
       it "returns the element at position N" do
         quickCheck $ \n (xs :: List Int) ->
           withHelp (nth n xs == PSList.head (PSList.drop n xs)) $
                                "Test failed:\nnth " <> show n <> " " <> show xs
                                <> "\nis not equal to\n"
                                <> show (PSList.head (PSList.drop n xs))
                                <> "\nInstead: " <> show (nth n xs)

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

     describe "`const`" do
       it "has `const`" do
         quickCheck $ \(n :: String) ->
           withHelp (const 3 n == 3)
           $ "Test failed:\nconst 3" <> show n
           <> "\nis not equal to\n3\nInstead: " <> show (const 3 n)

     describe "`id`" do
       it "has `id`" do
         quickCheck $ \(n :: String) ->
           withHelp (id n == n)
           $ "Test failed:\nid " <> show n
           <> "\nis not equal to\n" <> show n <> "\nInstead: " <> show (id n)

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
