module FpIntro.MaybeTest where

import FpIntro.Maybe

import FpIntro.TestUtils (specifyEqual)
import Prelude (Unit, discard, ($), (+), (/), (/=))
import Test.Spec (describe, it, Spec)
import Test.Spec.QuickCheck (quickCheck)

maybeSpec :: Spec Unit
maybeSpec = do
  describe "Maybe" do
    describe "`isJust`" do
      it "returns `true` for `Just _`" do
        quickCheck $ \(a :: Int) ->
          specifyEqual (isJust (Just a)) true
      it "returns `false` for `Nothing`" do
        quickCheck $ \(a :: Int) ->
          specifyEqual (isJust Nothing) false
  describe "`fromMaybe`" do
    it "returns `a` for `Just a`" do
      quickCheck $ \(a :: Int) (default :: Int) ->
        specifyEqual (fromMaybe default (Just a)) a
    it "returns `default` for `Nothing" do
      quickCheck $ \(default :: Int) ->
        specifyEqual (fromMaybe default Nothing) default
  describe "`maybe`" do
    it "returns `a` for `Just a`" do
      quickCheck $ \(a :: Int) ->
        specifyEqual (maybe (_ + 1) (Just a)) (Just (a + 1))
    it "returns `Nothing` for `Nothing" do
      quickCheck $ \(a :: Boolean) ->
        specifyEqual (maybe (_ + 1) Nothing) Nothing
  describe "`divide`" do
    it "returns `Nothing` when dividing by zero" do
      quickCheck $ \(a :: Int) ->
        specifyEqual (divide a 0) Nothing
    it "does integer divison properly" do
      quickCheck $ \(a :: Int) (b :: Int) ->
        specifyEqual (if b /= 0
          then Just (a / b)
          else Nothing) (divide a b)
