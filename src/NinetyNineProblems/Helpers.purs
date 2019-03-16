module NinetyNineProblems.Helpers (error, todo, undefined) where

import Effect.Exception.Unsafe (unsafeThrow)
import Prelude (unit, (<>))
import Unsafe.Coerce (unsafeCoerce)

undefined :: forall a. a
undefined = unsafeCoerce unit

error :: forall a. String -> a
error message = unsafeThrow message

todo :: forall a. String -> a
todo functionName = error ("TODO: Make `" <> functionName <> "`")
