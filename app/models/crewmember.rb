class CrewMember < ActiveRecord::Base
  belongs_to :starship
  validates :first_name, presence: true
  validates :last_name, presence: true
end
