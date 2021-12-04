class Task < ApplicationRecord
  belongs_to :user

  validates_presence_of :deadline, :duration_minutes, :duration_hours, :name
  validates :duration_minutes, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 59 }
  validates :duration_hours, numericality: { greater_than_or_equal_to: 0 }
  validate :hours_and_minutes_cant_both_be_zero

  def hours_and_minutes_cant_both_be_zero
    if self.duration_hours == 0 and self.duration_minutes == 0
      errors.add(:base, "must have some duration. Hours and minutes can't both be set to 0")
    end
  end
end
