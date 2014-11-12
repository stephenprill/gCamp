

require 'rails_helper'

  describe Task do
    it "fails past due date" do
      task = Task.new
      task.due_date = "11/11/2014"
      task.valid?
      expect(task.errors[:due_date].present?).to eq(true)
   end

    it "success on current and future date" do
      task = Task.new
      task.due_date = "12/08/2017"
      task.valid?
      expect(task.errors[:due_date].present?).to eq(false)
  end

  it "success on editing date on existing task" do
    Task.create!(description: "Chaka", due_date: "11/11/2014")
    task = Task.new(due_date:"10/10/2014")
    task.valid?
    expect(task.errors[:due_date].present?).to eq(false)
  end

end
