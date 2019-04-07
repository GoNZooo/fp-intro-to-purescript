module Test.Main where

import Prelude

import Data.Array (head)
import Data.Either (Either(..))
import Data.Maybe (Maybe(..))
import Data.String (toLower)
import Effect (Effect)
import Effect.Class.Console (log)
import NinetyNineProblems.ListTest (listSpec)
import NinetyNineProblems.MaybeTest (maybeSpec)
import NinetyNineProblems.RecursionTest (recursionSpec)
import NinetyNineProblems.SimpleTest (simpleSpec)
import Node.Yargs.Applicative (runY, yarg)
import Node.Yargs.Setup (example, usage)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (run)

main :: Effect Unit
main = let setup = usage "<pulp test> -t TestID -t TestID2" <> example "<pulp test> -t List -t Maybe" "Specify which tests to run"
       in runY setup $ (case _ of
         [] -> runTests Nothing
         args -> runTests (head args)) <$> yarg "t" [ "test"
                                                    ] (Just "A test to run") (Left []) false

runTests :: Maybe String -> Effect Unit
runTests (Just test) = runOneTest lowerCased
  where
  lowerCased = toLower test

runTests Nothing = run [consoleReporter] do
  simpleSpec
  recursionSpec
  maybeSpec
  listSpec

runOneTest :: String -> Effect Unit
runOneTest "simple" = run [consoleReporter] simpleSpec

runOneTest "maybe" = run [consoleReporter] maybeSpec

runOneTest "list" = run [consoleReporter] listSpec

runOneTest "recursion" = run [consoleReporter] recursionSpec

runOneTest test = log $ "Unknown test specified: " <> test
