class Monster < ApplicationRecord
  has_many :tweets,  dependent: :destroy
end
