module NinetyNineProblems.RecursionTest where

import Data.Foldable as PSFoldable
import Data.List ((..))
import NinetyNineProblems.Recursion (multiplyOneToN, sumZeroToN)
import Prelude (Unit, show, ($), (<>), (==), discard)
import Test.QuickCheck (withHelp)
import Test.Spec (describe, it, Spec)
import Test.Spec.QuickCheck (quickCheck')

recursionSpec :: Spec Unit
recursionSpec = do
  describe "Recursion" do
     describe "`sumZeroToN`" do
        it "sums all the numbers from zero to 30" do
           quickCheck' 1 $ \(a :: Boolean) ->
             withHelp (sumZeroToN 30 == PSFoldable.sum (0..30))
             $ "Test failed:\nsumZeroToN 30"
            <> "\nis not equal to: " <> show (PSFoldable.sum (0..30))
            <> "\nInstead: " <> show (sumZeroToN 30)

        it "returns 0 when given 0" do
           quickCheck' 1 $ \(a :: Boolean) ->
             withHelp (sumZeroToN 0 == 0)
             $ "Test failed:\nsumZeroToN 30"
            <> "\nis not equal to: 0"
            <> "\nInstead: " <> show (sumZeroToN 0)

     describe "`multiplyOneToN`" do
        it "gives the product of all the numbers from 1 to 10" do
           quickCheck' 1 $ \(a :: Boolean) ->
             withHelp (multiplyOneToN 10 == PSFoldable.product (1..10))
             $ "Test failed:\nmultiplyOneToN 10"
            <> "\nis not equal to: " <> show (PSFoldable.product (0..10))
            <> "\nInstead: " <> show (multiplyOneToN 30)

        it "returns 1 when given 0" do
           quickCheck' 1 $ \(a :: Boolean) ->
             withHelp (multiplyOneToN 1 == 1)
             $ "Test failed:\nmultiplyOneToN 30"
            <> "\nis not equal to: 0"
            <> "\nInstead: " <> show (multiplyOneToN 0)
