class Puppy < ActiveRecord::Base
  validates :name, :age, :breed, presence: true
  validates :age, numericality: true  # checks if this is a number
  validates :name, length: {minimum: 3} # {in: 3...20} is a number range 3 to 19   {in: 3..20} is a number range 3-20
end
