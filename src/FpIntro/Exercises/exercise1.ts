type Profession = "Teacher" | "SoftwareDeveloper" | "Nurse" | "Other";

interface Person {
  age: number;
  profession: Profession;
}

// Write a function that gets an age and a list of people and returns all the
// people above or equal to that age.
export const aboveAge = (n: number, people: Person[]): Person[] => {
  return people.filter(({ age }) => age >= n);
};

// Write a function that gets an age and a list of people and returns all the
// people below that age.
export const belowAge = (n: number, people: Person[]): Person[] => {
  return people.filter(({ age }) => age < n);
};

// Write a function that gets a profession and a list of people and returns all
// the people who have that profession.
export const haveProfession = (p: Profession, people: Person[]): Person[] => {
  return people.filter(({ profession }) => p === profession);
};

// Write a function that gets a list of professions and a list of people and
// returns all the people who have any of those professions.
export const haveAnyOfProfessions = (
  professions: Profession[],
  people: Person[]
): Person[] => {
  return people.filter(({ profession }) =>
    professions.some((p) => p === profession)
  );
};

// Write a function that gets a list of people and adds up all the ages.
export const totalAge = (people: Person[]): number => {
  return people.reduce((total, { age }) => total + age, 0);
};

// Write a function that gets a list of people and returns the highest age.
export const highestAge = (people: Person[]): number | null => {
  return people.reduce<number | null>(
    (highest, { age }) => Math.max(highest ?? age, age),
    null
  );
};

// Write a function that gets a list of people and returns the lowest age.
export const lowestAge = (people: Person[]): number | null => {
  return people.reduce<number | null>(
    (lowest, { age }) => Math.min(lowest ?? age, age),
    null
  );
};

interface AgeDifference {
  high: number;
  low: number;
}

// Write a function that gets a list of people and returns the biggest age
// difference that exists among the people.
export const biggestAgeDifference = (
  people: Person[]
): AgeDifference | null => {
  return people.reduce<AgeDifference | null>((difference, { age }) => {
    return {
      high: Math.max(difference?.high ?? age, age),
      low: Math.min(difference?.low ?? age, age),
    };
  }, null);
};
