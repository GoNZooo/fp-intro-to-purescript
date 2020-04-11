module FpIntro.Exercises.Exercise1

where

import Data.List (List)
import FpIntro.Helpers (undefined)

data Profession =
  Teacher
  | SoftwareDeveloper
  | Nurse
  | Other

newtype Person =
  Person
    { age :: Int
    , profession :: Profession
    }

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
haveAnyOfProfessions :: Profession -> List Person -> List Person
haveAnyOfProfessions = undefined

-- Write a function that gets a list of people and adds up all the age.
totalAge :: List Person -> Int
totalAge = undefined

-- Write a function that gets a list of people and returns the biggest age
-- difference that exists among the people.
biggestAgeDifference :: List Person -> Int
biggestAgeDifference = undefined
