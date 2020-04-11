module FpIntro.SimpleTest

where

import Prelude

import Data.Foldable as List
import Data.Int (even)
import Data.String as String
import FpIntro.Simple as Simple
import FpIntro.TestUtils (specifyEqual)
import Test.Spec (Spec, describe, it)
import Test.Spec.QuickCheck (quickCheck)

simpleSpec :: Spec Unit
simpleSpec = do
  describe "Simple" do
    describe "`subtract`" do
      it "subtracts" $
        quickCheck \a b ->
          specifyEqual (Simple.subtract a b) (a - b)

    describe "`multiply`" do
      it "multiplies" $
        quickCheck \a b ->
          specifyEqual (Simple.multiply a b) (a * b)

    describe "`negation`" do
      it "negates" $
        quickCheck \a ->
          specifyEqual (Simple.negation a) (- a)

    describe "`absolute`" do
      it "returns the absolute value" $
        quickCheck \a ->
          specifyEqual (Simple.absolute a) (if a < 0 then (- a) else a)

    describe "`subtractNegated`" do
      it "subtracts after negation" $
        quickCheck \a b ->
          specifyEqual (Simple.subtractNegated a b) (a - (- b))

    describe "`stringLengthIsEven`" do
      it "checks for even length of string" $
        quickCheck \s ->
          specifyEqual (Simple.stringLengthIsEven s) (even (String.length s))

    describe "`isDivisibleBy`" do
      it "checks whether or not `a` is divisible by `b`" $
        quickCheck \a b ->
          specifyEqual (Simple.isDivisibleBy a b) (a `mod` b == 0)

    describe "`isDivisibleBy2`" do
      it "checks whether or not `a` is divisible by 2" $
        quickCheck \a ->
          specifyEqual (Simple.isDivisibleBy2 a) (a `mod` 2 == 0)

    describe "`allDivisibleBy`" do
      it "checks whether or not all items are divisble by `a`" $
        quickCheck \a as ->
          specifyEqual (Simple.allDivisibleBy a as) (List.all (\x -> x `mod` a == 0) as)

    describe "`anyDivisibleBy`" do
      it "checks whether or not any item is divisble by `a`" $
        quickCheck \a as ->
          specifyEqual (Simple.anyDivisibleBy a as) (List.any (\x -> x `mod` a == 0) as)

