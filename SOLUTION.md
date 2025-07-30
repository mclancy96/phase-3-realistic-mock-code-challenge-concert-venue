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
def print_details
  "#{self.artist.name} performed #{self.song_title} at #{self.venue.name}"
end
```

### Venue

```ruby
# app/models/venue.rb
def book_performance(artist, song_title, duration)
  Performance.create(artist: artist, song_title: song_title, duration: duration, venue: self)
end

def self.oldest_venue
  self.order(:opening_year).first
end
```

### Artist

```ruby
# app/models/artist.rb
def performed_song?(song_title)
  self.performances.exists?(song_title: song_title)
end

def transfer_performance(artist, performance)
  performance.update(artist: artist)
  performance
end
```
