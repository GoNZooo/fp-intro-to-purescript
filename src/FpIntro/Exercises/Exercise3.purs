module FpIntro.Exercises.Exercise3

where

import Data.List (List)
import FpIntro.Helpers (undefined)

data Vacationer =
  Student
  | Business
  | Regular

newtype Prices =
  Prices
    { students :: Number
    , business :: Number
    , regular :: Number
    }

newtype Discounts =
  Discounts
    { students :: Offer
    , business :: Offer
    , regular :: Offer
    }

data Offer =
  Offer
    { people :: AmountOfPeople
    , percentage :: DiscountPercentage
    }

newtype AmountOfPeople =
  AmountOfPeople Int

newtype DiscountPercentage =
  DiscountPercentage Number

discounts :: Discounts
discounts =
  Discounts
    { students: Offer { people: AmountOfPeople 15
                      , percentage: DiscountPercentage 10.0
                      }
    , business: Offer { people: AmountOfPeople 30
                      , percentage: DiscountPercentage 15.0
                      }
    , regular: Offer { people: AmountOfPeople 40
                     , percentage: DiscountPercentage 5.0
                     }
    }

vacation :: List Vacationer -> Number
vacation = undefined