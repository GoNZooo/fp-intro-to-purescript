module NinetyNineProblems.Helpers
  (undefined, error, todo)
where

import Prelude (unit, (<>))
import Unsafe.Coerce (unsafeCoerce)
import Effect.Exception.Unsafe (unsafeThrow)

undefined :: forall a. a
undefined = unsafeCoerce unit

error :: forall a. String -> a
error message = unsafeThrow message

todo :: forall a. String -> a
todo functionName = error ("TODO: Make `" <> functionName <> "`")
