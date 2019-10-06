class User < ActiveRecord::Base
    has_friendship
    has_many :drink_beers
    has_many :beers, through: :drink_beers
    has_many :ratings
    has_many :beers, through: :ratings

    has_secure_password

  end