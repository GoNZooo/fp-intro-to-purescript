# FP-intro

## Purpose

The purpose of this repository is to present an introduction to functional
programming by way of PureScript. [PureScript](http://www.purescript.org/)
is a language focused on providing features normally associated with Haskell
offshoots, but in the context of JavaScript.

As such, it's built on a foundation of pure functional programming that is very
suitable for teaching and expressing abstraction via functions and data
structures.

## Setup

Run the following in order to set the project up:

```bash
yarn
yarn bower i
```

Make sure to also add the `"purescript.addNpmPath": true` setting in your
settings if you're using VSCode, as your PureScript installation won't be
picked up correctly from `node_modules` otherwise.

## Layout

Each module is structured more or less as a series of functions to implement.

## Testing exercises

Running `yarn test` will run the tests for the project and running
`yarn test:watch` will make sure that the tests are re-run when files change.

If you want to run only the tests for a certain file in watch mode, run
`yarn test:watch -- -- -t List` where "List" can also be "Maybe" or "Recursion"
as the tests are split up into the modules that they cover.

If you want to run only one test in watch mode, you can run
`yarn pulp -- -w test -- -t simple`, for example.

## Exercise order

While it's possible to open any file in the repository and start working, the
recommended order is as follows:

1. `Simple.purs` - This introduces the language of PureScript by way of simple
   functions that you may recognize from other languages.
2. `Bool.purs` - Introduces the concept of pattern matching by way of a series
   of functions operating on boolean values to produce new boolean values.
3. `Maybe.purs` - Introduces the idea of a data type that either contains a
   value of some type or contains nothing. This is a type-safe alternative to
   `null`.
4. `Recursion.purs` - Introduces non-list based recursion as a concept,
   emphasizing the idea slicing up work into discrete units.
5. `List.purs` - Introduces functions relating to linked lists and how to work
   with them in a functional context.

## Note about formatting

This repository uses a tool called `purty` for its code formatting. This is by
no means my favorite formatting and it may look odd to you, but I made the
decision to use a formatter because while it may not be the formatting choice I
would've made, it's instead a standardized choice made for us.