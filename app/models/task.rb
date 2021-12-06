class Task < ApplicationRecord
  belongs_to :user

  validates_presence_of :deadline, :duration_minutes, :duration_hours, :title, :duration
  validates :duration_minutes, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 59 }
  validates :duration_hours, numericality: { greater_than_or_equal_to: 0 }
  validate :hours_and_minutes_cant_both_be_zero, :deadline_is_in_the_future
  validates :duration, format: /\A\d\d:\d\d\z/

  def hours_and_minutes_cant_both_be_zero
    if self.duration_hours == 0 and self.duration_minutes == 0
      errors.add(:base, "must have some duration. Hours and minutes can't both be set to 0")
    end
  end

  def deadline_is_in_the_future
    if self.deadline.present? and self.deadline < DateTime.now
      errors.add(:deadline, "must be in the future. If the deadline already passed, why are you scheduling this?")
    end
  end

  def extract_duration_hours_and_minutes
    duration_string = self.duration.split(':')

    self.duration_hours   = duration_string[0].to_i
    self.duration_minutes = duration_string[1].to_i
  end
end
