module NinetyNineProblems.MaybeTest where

import NinetyNineProblems.Maybe

import Prelude (Unit, show, ($), (/), (<>), (==), (/=), (+), discard)
import Test.QuickCheck (withHelp)
import Test.Spec (describe, it, Spec)
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

     describe "`fromMaybe`" do
        it "returns `a` for `Just a`" do
           quickCheck $ \(a :: Int) (default :: Int) ->
             withHelp (fromMaybe default (Just a) == a)
             $ "Test failed:\nfromMaybe " <> show default <> " " <> show (Just a)
            <> "\nis not equal to: " <> show a
            <> "\nInstead: " <> show (fromMaybe default (Just a))

        it "returns `default` for `Nothing" do
           quickCheck $ \(default :: Int) ->
             withHelp (fromMaybe default Nothing == default)
             $ "Test failed:\nfromMaybe " <> show default <> " Nothing"
            <> "\nis not equal to: " <> show default
            <> "\nInstead: " <> show (fromMaybe default Nothing)

     describe "`maybe`" do
        it "returns `a` for `Just a`" do
           quickCheck $ \(a :: Int) ->
             withHelp (maybe (_ + 1) (Just a) == (Just (a + 1)))
             $ "Test failed:\nmaybe (_ + 1) " <> show (Just a)
            <> "\nis not equal to: (Just " <> show (a + 1) <> ")"
            <> "\nInstead: " <> show (maybe (_ + 1) (Just a))

        it "returns `Nothing` for `Nothing" do
           quickCheck $ \(a :: Boolean) ->
             withHelp (maybe (_ + 1) Nothing == Nothing)
             $ "Test failed:\nmaybe (_ + 1) Nothing"
            <> "\nis not equal to: Nothing"
            <> "\nInstead: " <> show (maybe (_ + 1) Nothing)

     describe "`divide`" do
       it "returns `Nothing` when dividing by zero" do
          quickCheck $ \(a :: Int) ->
            withHelp (divide a 0 == Nothing)
            $ "Test failed:\ndivide " <> show a <> " 0"
            <> "\nis not equal to: Nothing"
            <> "\nInstead: " <> show (divide a 0)

       it "does integer divison properly" do
          quickCheck $ \(a :: Int) (b :: Int) ->
            withHelp ((if b /= 0 then Just (a / b) else Nothing) == divide a b)
            $ "Test failed:\ndivide " <> show a <> " " <> show b
            <> "\nis not equal to\n"
            <> show (if b == 0 then Just (a / b) else Nothing)
            <> "\nInstead: " <> show (divide a b)
