module FpIntro.ListTest where

import FpIntro.List

import Data.List (List(..), (:), (..))
import FpIntro.Maybe (Maybe(..))
import FpIntro.TestUtils (specifyEqual)
import Prelude
  ( Unit
  , const
  , discard
  , flip
  , identity
  , join
  , ($)
  , (+)
  , (-)
  , (<=)
  , (<>)
  , (==)
  )
import Test.Spec (describe, it, Spec)
import Test.Spec.QuickCheck (quickCheck)

import Data.Foldable as PSFoldable
import Data.List as PSList
import Data.Unfoldable as PSUnfoldable
import Prelude as P

listSpec :: Spec Unit
listSpec = do
  describe "List" do
    describe "`head`" do
      it "returns the head of the list" do
        quickCheck $ \(x :: Int) (xs :: List Int) ->
          specifyEqual (head (x : xs)) (Just x)
    describe "`tail`" do
      it "returns the tail" do
        quickCheck $ \(x :: Int) (xs :: List Int) ->
          specifyEqual (tail (x : xs)) (Just xs)
    describe "`second`" do
      it "returns second element of list" do
        quickCheck $ \(x :: Int) (y :: Int) (xs :: List Int) ->
          specifyEqual (second (x : y : xs)) (Just y)
    describe "`last`" do
      it "returns the last element" do
        quickCheck $ \(x :: Int) (xs :: List Int) ->
          specifyEqual (last (PSList.reverse (x : xs))) (Just x)
    describe "`secondLast`" do
      it "returns the second to last element" do
        quickCheck $ \(x :: Int) (y :: Int) (xs :: List Int) ->
          specifyEqual (secondLast (PSList.reverse (x : y : xs))) (Just y)
    describe "`drop`" do
      it "drops the required amount of elements" do
        quickCheck $ \n (xs :: List Int) ->
          specifyEqual (drop n xs) (PSList.drop n xs)
    describe "`dropWhile`" do
      it "drops while predicate holds true" do
        let p = (_ <= 9)
            xs = (1 .. 10)
        quickCheck $ \(b :: Boolean) ->
          specifyEqual (dropWhile p xs) (PSList.dropWhile p xs)
      it "drops nothing on false" do
        let p = const false
            xs = (1 .. 10)
        quickCheck $ \(b :: Boolean) ->
          specifyEqual (dropWhile p xs == xs)
      it "drops everything on true" do
        let p = const true
            xs = (1 .. 10)
        quickCheck $ \(b :: Boolean) ->
          specifyEqual (dropWhile p xs == Nil)
    describe "`nth`" do
      it "returns the element at position N" do
        let getAnswer :: forall a. Int -> List a -> Maybe a
            getAnswer _ Nil = Nothing
            getAnswer n' (x : xs') = getAnswer (n' - 1) xs'
        quickCheck $ \n (xs :: List Int) ->
          specifyEqual (nth n xs) (getAnswer n xs)
    describe "`foldr`" do
      it "returns the same list on `foldr (:) xs`" do
        quickCheck $ \(xs :: List Int) ->
          specifyEqual (foldr (:) Nil xs) xs
    describe "`foldl`" do
      it "reverses the list when using flipped `:`" do
        quickCheck $ \(xs :: List Int) ->
          specifyEqual (foldl (flip (:)) Nil xs) (PSList.reverse xs)
    describe "`map`" do
      it "returns the same list on `map identity xs`" do
        quickCheck $ \(xs :: List Int) ->
          specifyEqual (map identity xs) xs
      it "maps `(_ + 1) over the list correctly`" do
        quickCheck $ \(xs :: List Int) ->
          specifyEqual (map (_ + 1) xs) (P.map (_ + 1) xs)
    describe "`sum`" do
      it "sums the list" do
        quickCheck $ \(xs :: List Int) ->
          specifyEqual (sum xs) (PSFoldable.sum xs)
    describe "`length`" do
      it "returns correct length" do
        quickCheck $ \(xs :: List Boolean) ->
          specifyEqual (length xs) (PSList.length xs)
    describe "`append`" do
      it "appends two lists" do
        quickCheck $ \(xs :: List Int) (ys :: List Int) ->
          specifyEqual (append xs ys) (xs <> ys)
    describe "`reverse`" do
      it "reverses the list" do
        quickCheck $ \(xs :: List Int) ->
          specifyEqual (reverse xs) (PSList.reverse xs)
    describe "`replicate`" do
      it "creates a list of the correct length" do
        quickCheck $ \(a :: Int) ->
          specifyEqual (replicate 50 a) (PSUnfoldable.replicate 50 a)
    describe "`isPalindrome`" do
      it "returns true for known cases" do
        quickCheck $ \(xs :: List Int) x ->
          specifyEqual (isPalindrome (xs <> PSList.singleton x <> (PSList.reverse xs))) true
        quickCheck $ \(xs :: List Int) ->
          specifyEqual (isPalindrome xs) (xs == PSList.reverse xs)
    describe "`flatten`" do
      it "flattens the lists into one list" do
        quickCheck $ \(xs :: List (List Int)) ->
          specifyEqual (flatten xs) (join xs)
