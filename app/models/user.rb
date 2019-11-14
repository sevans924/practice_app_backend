class User < ActiveRecord::Base
    has_friendship
    has_many :drink_beers
    has_many :beers, through: :drink_beers
    has_many :ratings
    has_many :beers, through: :ratings

    has_secure_password

    def has_beer?
      if self.beers.length == 0
        "Head to the bar and order a beer for your collection"
      else
        self.beers
    end
  end

  end