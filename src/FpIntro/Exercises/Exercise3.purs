module FpIntro.Exercises.Exercise3 where

import Data.List (List)
import FpIntro.Helpers (undefined)

data Vacationer
  = Student
  | Business
  | Regular

newtype Prices
  = Prices
  { students :: Number
  , business :: Number
  , regular :: Number
  }

newtype Discounts
  = Discounts
  { students :: Offer
  , business :: Offer
  , regular :: Offer
  }

newtype Offer
  = Offer
  { people :: AmountOfPeople
  , percentage :: DiscountPercentage
  }

newtype AmountOfPeople
  = AmountOfPeople Int

newtype DiscountPercentage
  = DiscountPercentage Number

discounts :: Discounts
discounts =
  Discounts
    { students:
        Offer
          { people: AmountOfPeople 15
          , percentage: DiscountPercentage 10.0
          }
    , business:
        Offer
          { people: AmountOfPeople 30
          , percentage: DiscountPercentage 15.0
          }
    , regular:
        Offer
          { people: AmountOfPeople 40
          , percentage: DiscountPercentage 5.0
          }
    }

-- Create a function that receives a list of vacationers and calculates the
-- total price for all of them, given the data in `discounts`. When the amount
-- of people is equal to or above the specified amount, all ticket purchases get
-- discounted by the specified percentage for that group.
vacation :: List Vacationer -> Number
vacation = undefined

-- Create a function that does the same thing as `vacation` but from a list of
-- strings. The strings should be decoded into a list of vacationers.
decodeVacation :: List String -> Number
decodeVacation = undefined
