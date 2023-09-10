class Category < ApplicationRecord
    has_many :bubbles, dependent: :destroy
end
