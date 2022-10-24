class Tweet < ApplicationRecord
  belongs_to :monster,  dependent: :destroy
end
