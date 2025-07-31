# Solution

## Create the third migration

```ruby
class CreatePerformances < ActiveRecord::Migration[6.1]
  def change
    create_table :performances do |t|
      t.string :song_title
      t.integer :duration
      t.integer :artist_id
      t.integer :venue_id
    end
  end
end
```

## Add the ActiveRecord associations

```ruby
# app/models/venue.rb
class Venue < ActiveRecord::Base
  has_many :performances
  has_many :artists, through: :performances
end
```

```ruby
# app/models/artist.rb
class Artist < ActiveRecord::Base
  has_many :performances
  has_many :venues, through: :performances
end
```

```ruby
# app/models/performance.rb
class Performance < ActiveRecord::Base
  belongs_to :venue
  belongs_to :artist
end
```

## Build the required methods

### Performance

```ruby
# app/models/performance.rb
def introduction
  "Hello #{self.venue.name}!!! We are #{self.artist.name}!"
end
```

### Venue

```ruby
# app/models/venue.rb
def concert_on(date)
  # Note: date parameter is accepted but not stored - used as trigger for soundcheck
  first_artist = Artist.first
  Performance.create(
    song_title: "Check, check.. test, test",
    duration: 30,
    artist: first_artist,
    venue: self
  )
end

def self.most_performances
  # Join with performances, group by venue, order by count (descending), get first
  self.joins(:performances)
      .group('venues.id')
      .order('COUNT(performances.id) DESC')
      .first
end
```

### Artist

```ruby
# app/models/artist.rb
def total_duration
  # Sum all performance durations for this artist
  self.performances.sum(:duration)
end

def plays_at_venue?(venue)
  # Check if venue is in the artist's venues collection
  self.venues.include?(venue)
end
```
