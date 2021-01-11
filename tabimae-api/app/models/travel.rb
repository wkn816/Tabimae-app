class Travel < ApplicationRecord
  belongs_to :user
  has_many :trains
  has_many :airs
end
