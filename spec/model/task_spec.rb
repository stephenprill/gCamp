

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
      task = Task.create!(description: "buy presents", due_date: "11/12/2014")
      task.due_date = "10/10/2014"
      task.valid?
      expect(task.errors[:due_date].present?).to eq(false)
    end

    it "succuss on editing exisiting date to future date"
      task = Task.create!(description: "buy presents", due_date: "11/01/2014")
      task.due_date = "12/12/2014"
      task.valid?
      expect(task.errors[:due_date].present?).to eq(false)
      task.due_date = "12/11/2014"
      task.valid?
      expect(task.errors[:due_date].present?).to eq(false)
    end

    #travel_back
    #so have old date and edit it for a new date

end
