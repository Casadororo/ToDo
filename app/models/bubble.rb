class Bubble < ApplicationRecord
  belongs_to :category
  belongs_to :user
  acts_as_list scope: :category
end
