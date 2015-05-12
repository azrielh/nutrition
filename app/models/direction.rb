class Direction < ActiveRecord::Base
  belongs_to :recipe

  validates :instruction, presence: true
  
end
