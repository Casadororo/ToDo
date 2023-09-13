class Category < ApplicationRecord
    has_many :bubbles, dependent: :destroy
    belongs_to :user
end
