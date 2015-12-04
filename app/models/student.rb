class Student < ActiveRecord::Base
  has_many :participations, dependent: :destroy
  has_many :subject_item_notes, dependent: :destroy


  validates :first_name, :last_name, presence: true
  accepts_nested_attributes_for :participations
end
