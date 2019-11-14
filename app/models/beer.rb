class Beer < ActiveRecord::Base

    has_many :drink_beers
    has_many :users, through: :drink_beers
    has_many :ratings
    has_many :users, through: :ratings


    def is_it_org
        if self.isOrganic
            "Yes"
        else
            "No"
    end
end


end