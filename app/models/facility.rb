class Facility < ActiveRecord::Base
    has_many :maps
    validates_uniqueness_of :name
end
