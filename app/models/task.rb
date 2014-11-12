class Task < ActiveRecord::Base

  validate :check_due_date, on: :create

  def check_due_date
    if due_date < Date.today
      errors.add(:due_date, "can only be today or later.")
    end
  end
end
