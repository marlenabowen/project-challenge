class Dog < ApplicationRecord
  belongs_to :user, optional: true
  has_many_attached :images
  acts_as_votable
end
