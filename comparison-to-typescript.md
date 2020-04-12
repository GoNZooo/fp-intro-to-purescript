# Comparison to TypeScript

TypeScript and PureScript fill essentially the same loosely defined niche in
the software landscape. They're both tools for writing on average safer and more
robust code that still needs to have reach, both doing so by way of TypeScript.

PureScript also compiles to other platforms, but the essence remains the same:
We can write in a language that enforces cohesion in our code so that these
incoherences aren't detected when the code runs, as it is wont to do in
languages that don't have the same facilities.

Serving the same purpose, these languages are bound to have similarities, but
also some differences. Let's look at a few.

## Syntax

### Named functions

```typescript
const functionName = (
  parameter1: Parameter1Type,
  parameter2: Parameter2Type
): ReturnType => {
  return doSomethingWith(parameter1, parameter2);
};
```

```purescript
functionName :: Parameter1Type -> Parameter2Type -> ReturnType
functionName parameter1 parameter2 = doSomethingWith parameter1 parameter2
```

Note the difference in where we put our types. We have a separate line for our
type declaration in PureScript.

### Anonymous functions

```typescript
(parameter1, parameter2) => doSomethingWith(parameter1, parameter2);
```

```purescript
\parameter1 parameter2 -> doSomethingWith parameter1 parameter2
```

In many ways the PureScript version just looks like we removed special characters
from our JavaScript/TypeScript version.

### Introducing new bindings/"variables"

We usually want to pack up some bit of calculation into a name so that we can
refer to it by name in the rest of our code.

```typescript
const elementWithWidth = (element: Element, aspectRatio: number): FullElement => {
  const height = elementHeight(element);
  const width = calculateWidth(height, aspectRatio);
  
  return createElement(element, width, height);
}
```

```purescript
elementWithWidth :: Element -> Number -> FullElement
elementWithWidth element aspectRatio =
  let
    height = elementHeight element
    width = calculateWidth height aspectRatio
  in
    createElement element width height
```

Note that the choice to use `const` is deliberate, as all bindings in PureScript
are implicitly `const`. The ability to change a value as if it was bound with
`let` is there, but comes in other forms, via the type system.

We are creating our new bindings in a sectioned out portion between the words
`let` and `in` here. You can view this as saying
"let height be the result of `elementHeight element` and width be the result of
`calculateWidth height aspectRatio` in the following code.

## Primitive datatypes

The primitive datatypes in a language/environment are the basic data types that
make up all other types.

In TypeScript these are:

- `number`
- `string`
- `boolean`
- `symbol`
- `null`
- `undefined`

PureScript does not match this 1-for-1, but the differences aren't too stark:

- `number` is split into `Int` and `Number` depending on whether or not you want
  to represent an integer or a floating point value.
- `string` is `String`, but `Char` exists to represent a single character
- `boolean` is `Boolean`
- `symbol` is `Symbol`
- Both `null` and `undefined` are expressed using `Maybe SomeType`. This is a
  container type expressing the existence or non-existence of something.

This last bit is worth looking at in just a bit more detail.

### `null` or `undefined` / `Maybe`

When expressing the absence or existence of something in TypeScript, we usually
do the following:

```typescript
const heightOf = (element: OurElement | null): number => {
  return element !== null ? element.height : 0;
};
```

In newer TypeScript versions you can also write:

```typescript
const heightOf = (element: OurElement | null): number => {
  // The element is first checked for `null`. If it's `null` the entire
  // `element?.height` expression will be `null`. If it is, the `??` operator
  // will make the full expression return 0.
  // If it's not `null`, the `element?.height` expression will instead return
  // the actual number and that's what will be returned.
  return element?.height ?? 0;
};
```

In PureScript, since this is a container type wrapping something else, we define
`Maybe` as follows:

```purescript
data Maybe a =
  Nothing
  | Just a
```

The `a` in this definition can stand in for any type, since `Maybe` can wrap any
type you want. When you have a `Maybe Int` you either have `Nothing` or `Just 1`,
for example.

There are a few ways of checking for the existence of `element` available to us.

We can "pattern-match" on the constructors of the value, in this case `Just` &
`Nothing`:

```purescript
heightOf :: Maybe OurElement -> Number
heightOf (Just element) = element.height
heightOf Nothing        = 0.0
```

We can also do use a `case` expression to do case analysis of the value:

```purescript
heightOf :: Maybe OurElement -> Number
heightOf maybeElement =
  case maybeElement of
    Just element -> element.height
    Nothing      -> 0.0
```

In this case (and many others) there are functions that themselves take functions
as arguments to determine what to do for each case of the value. In this case we
are first passing the value that will be returned when the value is `Nothing`,
0.0 and then we are passing the function to execute on the element if there is
one.

```purescript
heightOf :: Maybe OurElement -> Number
heightOf maybeElement =
  maybe 0.0 (\element -> element.height) maybeElement
```

This brings us to the topic of composite types.

## Composite types

A composite type is one that is created out of the primitive types. `Maybe` is
one of these, together with a big amount of readily available ones in the eco
system.

Let's look at how we might define a person in TypeScript:

```typescript
interface Person {
  name: string;
  age: number;
  // This could also be `Array<string>`
  hobbies: string[];
}

// creates a `Person`
const Person = (name: string, age: number, hobbies: string[]): Person => {
  // could also be {name: name, age: age, hobbies: hobbies}
  return { name, age, hobbies };
};
```

```purescript
data Person =
  Person { name    :: String
         , age     :: Int
         , hobbies :: Array String
         }
```

Note that the constructor function we made above for `Person` corresponds to the
`Person` constructor we have in PureScript. When we want to create a person we
simply say:

```purescript
myPerson = Person {name: "Rickard", age: 32, hobbies: ["programming", "gaming"]}
```
