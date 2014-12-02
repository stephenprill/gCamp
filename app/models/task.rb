class Task < ActiveRecord::Base

  belongs_to :project
  has_many :comments, dependent: :destroy

  validate :check_due_date, on: :create
  validates :description, presence: true 

  def check_due_date
    if due_date.present? && due_date < Date.today
      errors.add(:due_date, "can only be today or later.")
    end


  end
end
