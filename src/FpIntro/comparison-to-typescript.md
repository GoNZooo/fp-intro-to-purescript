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
