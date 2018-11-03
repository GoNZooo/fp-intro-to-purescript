module Test.Main where

import Prelude (Unit)
import Effect (Effect)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (run)

import NinetyNineProblems.ListTest

main :: Effect Unit
main = run [consoleReporter] do
  listSpec
