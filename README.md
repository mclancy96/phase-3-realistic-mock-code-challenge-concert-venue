# Concert Venue Tracker

For this assignment, we'll be working with a concert venue domain.

We have three models: `Venue`, `Artist`, and `Performance`.

For our purposes, a `Venue` has many `Performance`s, an `Artist` has many
`Performance`s, and a `Performance` belongs to a `Venue` and to an `Artist`.

`Venue` - `Artist` is a many to many relationship.

**Note**: You should draw your domain on paper or on a whiteboard _before you
start coding_. Identify a single source of truth for your data.

## Topics

- Classes and Instances
- Class and Instance Methods
- Variable Scope
- Object Relationships
- Arrays and Array Methods

## Instructions

To get started, run `bundle install` while inside of this directory.

Build out all of the methods listed in the deliverables. The methods are listed
in a suggested order, but you can feel free to tackle the ones you think are
easiest. Be careful: some of the later methods rely on earlier ones.

**Remember!** This code challenge does not have tests. You cannot run `rspec`
and you cannot run `learn`. You'll need to create your own sample instances so
that you can try out your code on your own. Make sure your relationships and
methods work in the console before submitting.

We've provided you with a tool that you can use to test your code. To enter a
console session, run `rake console` from the command line. You'll be able to
test out the methods that you write here. You can add code to the
`db/seeds.rb` file to define variables and create sample data. Then, when you
run `rake console`, your variables will be available in the console session.

Writing error-free code is more important than completing all of the
deliverables listed - prioritize writing methods that work over writing more
methods that don't work. You should test your code in the console as you write.

Similarly, messy code that works is better than clean code that doesn't. First,
prioritize getting things working. Then, if there is time at the end, refactor
your code to adhere to best practices. When you encounter duplicated logic,
extract it into a shared helper method.

**Before you submit!** Save and run your code to verify that it works as you
expect. If you have any methods that are not working yet, feel free to leave
comments describing your progress.

## What You Already Have

The starter code has migrations and models for the initial `Venue` and `Artist`
models, and seed data for some `Venue`s and `Artist`s. The schema currently
looks like this:

#### `venues` Table

| Column       | Type    |
| ------------ | ------- |
| name         | String  |
| opening_year | Integer |

#### `artists` Table

| Column | Type   |
| ------ | ------ |
| name   | String |

You will need to create the migration for the `performances` table using the
attributes specified in the deliverables below.

## Deliverables

Write the following methods in the classes in the files provided. Feel free to
build out any helper methods if needed.

Deliverables use the notation `#` for instance methods, and `.` for class
methods.

Remember: ActiveRecord give your classes access to a lot of methods already!
Keep in mind what methods ActiveRecord gives you access to on each of your
classes when you're approaching the deliverables below.

### Migrations

Before working on the rest of the deliverables, you will need to create a
migration for the `performances` table.

- A `Performance` belongs to a `Venue`, and a `Performance` also belongs to an
  `Artist`. In your migration, create any columns your `performances` table will
  need to establish these relationships.
- The `performances` table should also have:
  - A `song_title` column that stores a string.
  - A `duration` column that stores an integer.

After creating the `performances` table using a migration, use the `seeds.rb`
file to create instances of your `Performance` class so you can test your code.

**Once you've set up your `performances` table**, work on building out the following
deliverables.

### Object Relationship Methods

Use ActiveRecord association macros and ActiveRecord query methods where
appropriate (i.e. `has_many`, `has_many through`, and `belongs_to`).

#### Performance

- `Performance#venue`
  - should return the `Venue` instance for this performance
- `Performance#artist`
  - should return the `Artist` instance for this performance

#### Venue

- `Venue#performances`
  - returns a collection of all the performances for the venue
- `Venue#artists`
  - returns a collection of all the artists who performed at the venue

#### Artist

- `Artist#performances`
  - should return a collection of all the performances by the artist
- `Artist#venues`
  - should return a collection of all the venues that the artist has performed at

### Aggregate and Association Methods

#### Performance

- `Performance#introduction`
  - should return a string formatted as follows:
    `"Hello {venue name}!!! We are {artist name}!"`
  - This simulates the artist introducing themselves at the start of a show

#### Venue

- `Venue#concert_on(date)`

  - takes a `date` (string) as an argument and creates a new `performance`
    associated with this venue
  - the performance should have `song_title` of "Check, check.. test, test",
    `duration` of 30 (soundcheck time), and be associated with the first artist
    in the database (using `Artist.first`)
  - returns the newly created performance

- `Venue.most_performances`
  - returns the `Venue` instance that has hosted the most performances
  - uses ActiveRecord methods to join with performances, group by venue,
    order by count descending, and return the first result
  - in the case of a tie, return the venue that appears first in the database

#### Artist

- `Artist#total_duration`

  - returns the total duration (in seconds) of all the artist's performances
  - uses ActiveRecord's `sum` method on the performances association
  - if the artist has no performances, return 0

- `Artist#plays_at_venue?(venue)`
  - takes a `venue` (an instance of the `Venue` class) and returns `true` if
    the artist has ever performed at that venue, `false` otherwise
  - uses the `include?` method on the artist's venues association
