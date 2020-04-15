module FpIntro.Exercises.Exercise1Test where

import Prelude

import Data.Foldable (maximumBy, minimumBy)
import Data.List as List
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))
import Debug.Trace as Debug
import Debug.Trace as Debug.Trace
import FpIntro.Exercises.Exercise1 (Person(..))
import FpIntro.Exercises.Exercise1 as Ex1
import FpIntro.Helpers as Helpers
import FpIntro.TestUtils (specifyEqual)
import Test.QuickCheck (Result(..))
import Test.Spec (Spec, describe, it)
import Test.Spec.QuickCheck (quickCheck)

exercise1Spec :: Spec Unit
exercise1Spec = do
  describe "Exercise1" do
    describe "`aboveAge`" do
      it "filters"
        $ quickCheck \n people ->
            specifyEqual (Ex1.aboveAge n people)
              (List.filter (\(Person { age }) -> age >= n) people)
    describe "`belowAge`" do
      it "filters"
        $ quickCheck \n people ->
            specifyEqual (Ex1.belowAge n people)
              (List.filter (\(Person { age }) -> age < n) people)
    describe "`haveProfession`" do
      it "filters"
        $ quickCheck \p people ->
            specifyEqual (Ex1.haveProfession p people)
              (List.filter (\(Person { profession }) -> profession == p) people)
    describe "`haveProfession`" do
      it "filters"
        $ quickCheck \ps people ->
            specifyEqual (Ex1.haveAnyOfProfessions ps people)
              ( List.filter (\(Person { profession }) -> List.any (\p -> profession == p) ps)
                  people
              )
    describe "`totalAge`" do
      it "sums the ages"
        $ quickCheck \people ->
            specifyEqual (Ex1.totalAge people)
              (List.foldr (\(Person { age }) total -> total + age) 0 people)
    describe "`biggestAgeDifference`" do
      it "gets the biggest difference"
        $ quickCheck \people ->
            let
              oldest =
                maximumBy
                  ( \(Person { age: aAge }) (Person { age: bAge }) ->
                        compare aAge bAge
                  )
                  people

              youngest =
                minimumBy
                  ( \(Person { age: aAge }) (Person { age: bAge }) ->
                      compare aAge bAge
                  )
                  people
            in
              case Tuple oldest youngest of
                Tuple
                  (Just (Person { age: maxAge' }))
                  (Just (Person { age: minAge' })) ->
                  specifyEqual (Ex1.biggestAgeDifference people)
                    { low: minAge', high: maxAge' }
                Tuple Nothing Nothing ->
                  Success
                result ->
                  Helpers.error
                    $ "Couldn't get min & max age in generated people: "
                    <> show result
