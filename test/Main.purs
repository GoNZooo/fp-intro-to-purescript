module Test.Main where

import NinetyNineProblems.ListTest (listSpec)
import NinetyNineProblems.MaybeTest (maybeSpec)
import NinetyNineProblems.RecursionTest (recursionSpec)

import Effect (Effect)
import Prelude (Unit, discard)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (run)

main :: Effect Unit
main = run [consoleReporter] do
  recursionSpec
  maybeSpec
  listSpec
