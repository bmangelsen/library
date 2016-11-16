class Reservation < ApplicationRecord
  belongs_to :book
  validates :due_date, presence: true
  validates :name, presence: true
end
