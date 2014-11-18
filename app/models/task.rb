class Task < ActiveRecord::Base

  belongs_to :project  

  validate :check_due_date, on: :create

  def check_due_date
    if due_date.present? && due_date < Date.today
      errors.add(:due_date, "can only be today or later.")
    end


  end
end
