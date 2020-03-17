module Test.Main where

import Prelude

import Data.Array (head)
import Data.Either (Either(..))
import Data.Maybe (Maybe(..))
import Data.String (toLower)
import Effect (Effect)
import Effect.Aff (Aff)
import Effect.Aff as Aff
import Effect.Class.Console (log)
import FpIntro.ListTest (listSpec)
import FpIntro.MaybeTest (maybeSpec)
import FpIntro.RecursionTest (recursionSpec)
import FpIntro.SimpleTest (simpleSpec)
import Node.Yargs.Applicative (runY, yarg)
import Node.Yargs.Setup (example, usage)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (runSpec)

main :: Effect Unit
main =
  let
    setup =
      usage "<spago test> -t TestID -t TestID2" <> example "<spago test> -t List -t Maybe" "Specify which tests to run"
  in
    runY setup $
      (case _ of
         [] ->
           Aff.launchAff_ $ runTests Nothing
         args ->
           Aff.launchAff_ $
             runTests (head args)) <$> yarg "t" ["test"]
                                                (Just "A test to run")
                                                (Left [])
                                                false

runTests :: Maybe String -> Aff Unit
runTests (Just test) = runOneTest lowerCased
  where
  lowerCased = toLower test

runTests Nothing = runSpec [consoleReporter] do
  simpleSpec
  recursionSpec
  maybeSpec
  listSpec

runOneTest :: String -> Aff Unit
runOneTest "simple" = runSpec [consoleReporter] simpleSpec

runOneTest "maybe" = runSpec [consoleReporter] maybeSpec

runOneTest "list" = runSpec [consoleReporter] listSpec

runOneTest "recursion" = runSpec [consoleReporter] recursionSpec

runOneTest test = log $ "Unknown test specified: " <> test
