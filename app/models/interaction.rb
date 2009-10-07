class Interaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :behavior
  belongs_to :interaction_category
  has_one :image
end
