module NinetyNineProblems.TestUtils
  (
    specifyEqual
  )
where

import Prelude

import Test.QuickCheck (Result, withHelp)

specifyEqual :: forall a. Eq a => Show a => a -> a -> Result
specifyEqual exec expectedValue =
  withHelp (exec == expectedValue)
  $ "Test failed: " <> show exec
    <> "!="
    <> show expectedValue
