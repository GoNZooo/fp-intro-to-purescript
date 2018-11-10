module NinetyNineProblems.RecursionTest where

import Prelude

import Data.Foldable as PSFoldable
import Data.List ((..))
import NinetyNineProblems.Recursion (multiplyOneToN, sumZeroToN)
import NinetyNineProblems.TestUtils (specifyEqual)
import Test.Spec (describe, it, Spec)
import Test.Spec.QuickCheck (quickCheck')

recursionSpec :: Spec Unit
recursionSpec = do
  describe "Recursion" do
    describe "`sumZeroToN`" do
      it "sums all the numbers from zero to 30" do
        quickCheck' 1 $ \(a :: Boolean) ->
          specifyEqual (sumZeroToN 30) (PSFoldable.sum (0..30))

      it "returns 0 when given 0" do
        quickCheck' 1 $ \(a :: Boolean) ->
          specifyEqual (sumZeroToN 0) 0

  describe "`multiplyOneToN`" do
    it "gives the product of all the numbers from 1 to 10" do
      quickCheck' 1 $ \(a :: Boolean) ->
        specifyEqual (multiplyOneToN 10) (PSFoldable.product (1..10))

    it "returns 1 when given 0" do
      quickCheck' 1 $ \(a :: Boolean) ->
        specifyEqual (multiplyOneToN 1) 1

