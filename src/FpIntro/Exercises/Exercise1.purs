module FpIntro.Exercises.Exercise1 where

import Prelude
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.List (List)
import Data.Maybe (Maybe)
import Data.Newtype (class Newtype)
import FpIntro.Helpers (undefined)
import Test.QuickCheck (class Arbitrary)
import Test.QuickCheck.Arbitrary (genericArbitrary)

-- In PureScript we can create functions in several ways. We can define them 
-- with names as follows:
--
-- ```
-- functionName :: Parameter1Type -> Parameter2Type -> ReturnType`
-- functionName parameter1 parameter2 = doingSomethingWith parameter2 parameter1
-- ```
-- The above is analogous to the following TypeScript code:
--
-- ```
-- const functionName = (
--   parameter1: Parameter1Type,
--   parameter2: Parameter2Type
-- ): ReturnType => {
--   return doingSomethingWith(parameter2, parameter1);
-- };
-- ```
--
-- We can also create what's known as "anonymous functions", also commonly known
-- as "lambda functions" or "lambdas".
--
-- These are functions that are not given a name but are created on the spot.
-- We create them in PureScript as follows:
--
-- `\parameter1 parameter2 -> doingSomethingWith parameter2 parameter1`
--
-- That is the character '\' followed immediately by the parameters we want the
-- function to have, then `->` and the function body. This is analogous to doing
-- the following in JavaScript:
-- `(parameter1, parameter2) => doingSomethingWith(parameter2, parameter1)`
data Profession
  = Teacher
  | SoftwareDeveloper
  | Nurse
  | Other

derive instance eqProfession :: Eq Profession

derive instance genericProfession :: Generic Profession _

instance showProfession :: Show Profession where
  show = genericShow

instance arbitraryProfession :: Arbitrary Profession where
  arbitrary = genericArbitrary

newtype Person
  = Person
  { age :: Int
  , profession :: Profession
  }

derive instance eqPerson :: Eq Person

derive instance genericPerson :: Generic Person _

derive instance newtypePerson :: Newtype Person _

instance showPerson :: Show Person where
  show = genericShow

instance arbitraryPerson :: Arbitrary Person where
  arbitrary = genericArbitrary

-- Write a function that gets an age and a list of people and returns all the
-- people above or equal to that age.
aboveAge :: Int -> List Person -> List Person
aboveAge = undefined

-- Write a function that gets an age and a list of people and returns all the
-- people below that age.
belowAge :: Int -> List Person -> List Person
belowAge = undefined

-- Write a function that gets a profession and a list of people and returns all
-- the people who have that profession.
haveProfession :: Profession -> List Person -> List Person
haveProfession = undefined

-- Write a function that gets a list of professions and a list of people and
-- returns all the people who have any of those professions.
haveAnyOfProfessions :: List Profession -> List Person -> List Person
haveAnyOfProfessions = undefined

-- Write a function that gets a list of people and adds up all the ages.
totalAge :: List Person -> Int
totalAge = undefined

type AgeDifference
  = { low :: Int
    , high :: Int
    }

-- Write a function that gets a list of people and returns the highest age.
highestAge :: List Person -> Maybe Int
highestAge = undefined

-- Write a function that gets a list of people and returns the lowest age.
lowestAge :: List Person -> Maybe Int
lowestAge = undefined

-- Write a function that gets a list of people and returns the biggest age
-- difference that exists among the people.
biggestAgeDifference :: List Person -> Maybe AgeDifference
biggestAgeDifference = undefined
