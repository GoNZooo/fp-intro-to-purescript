module NinetyNineProblems.MaybeTest where

import NinetyNineProblems.Maybe

import Data.Maybe (Maybe(..))
import Prelude (Unit, show, ($), (/), (<>), (==), (/=), discard)
import Test.QuickCheck (withHelp)
import Test.Spec (describe, it, Spec)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.QuickCheck (quickCheck)

maybeSpec :: Spec Unit
maybeSpec = do
  describe "Maybe" do
     describe "`isJust`" do
        it "returns `true` for `Just _`" do
           quickCheck $ \(a :: Int) ->
             withHelp (isJust (Just a) == true)
             $ "Test failed:\nisJust " <> show (Just a)
            <> "\nis not equal to: true"
            <> "\nInstead: " <> show (isJust (Just a))

        it "returns `false` for `Nothing`" do
           quickCheck $ \(a :: Int) ->
             withHelp (isJust Nothing == false)
             $ "Test failed:\nisJust Nothing"
            <> "\nis not equal to: false"
            <> "\nInstead: " <> show (isJust Nothing)

     describe "`maybe`" do
        it "returns `a` for `Just a`" do
           quickCheck $ \(a :: Int) (default :: Int) ->
             withHelp (maybe default (Just a) == a)
             $ "Test failed:\nmaybe " <> show default <> " " <> show (Just a)
            <> "\nis not equal to: " <> show a
            <> "\nInstead: " <> show (maybe default (Just a))

        it "returns `default` for `Nothing" do
           quickCheck $ \(default :: Int) ->
             withHelp (maybe default Nothing == default)
             $ "Test failed:\nmaybe " <> show default <> " Nothing"
            <> "\nis not equal to: " <> show default
            <> "\nInstead: " <> show (maybe default Nothing)

     describe "`divide`" do
       it "returns `Nothing` when dividing by zero" do
          quickCheck $ \(a :: Int) ->
            withHelp (divide a 0 == Nothing)
            $ "Test failed:\ndivide " <> show a <> " 0"
            <> "\nis not equal to: Nothing"
            <> "\nInstead: " <> show (divide a 0)

       it "dose integer divison properly" do
          quickCheck $ \(a :: Int) (b :: Int) ->
            withHelp ((if b /= 0 then Just (a / b) else Nothing) == divide a b)
            $ "Test failed:\ndivide " <> show a <> " " <> show b
            <> "\nis not equal to\n"
            <> show (if b == 0 then Just (a / b) else Nothing)
            <> "\nInstead: " <> show (divide a b)
