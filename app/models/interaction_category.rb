class InteractionCategory < ActiveRecord::Base
  has_many  :interactions
  belongs_to  :user
end
