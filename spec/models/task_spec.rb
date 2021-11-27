require 'rails_helper'

RSpec.describe Task, type: :model do
  let!(:category) {Category.create(name: "Sample")}
  context '#4 As a User, I want to create a task for a specific category so that I can organize tasks quicker.' do
    it 'Task instance count should be equal to 1 once saved (from 0)' do
      expect{
        category.tasks.create(category_id: 1, name: 'Test Task', task_date: Date.tomorrow())
      }.to change(Category.find(1).tasks, :count).by(1)
    end

    it 'Task instance should pass even if category_id is blank' do
      task = category.tasks.create( name: 'Test Task', task_date: Date.tomorrow())

      expect(task).to be_valid
      expect(task.errors).to_not be_present
      expect(task.errors.to_hash.keys).to_not include(:category_id)
    end

    it 'Task instance should reject if task date is blank' do
      task = category.tasks.new
      task.name = 'Test Name'

      expect(task).to_not be_valid
      expect(task.errors).to be_present
      expect(task.errors.to_hash.keys).to include(:task_date)
    end

  end

  context '#5: As a User, I want to edit a task to update task\'s details.' do
    it 'Task should update if name is changed' do
      task = category.tasks.create( name: 'Test Task', task_date: Date.tomorrow())
      category.tasks.find_by(name: 'Test Task').update(name: 'Revised name')

      expect(category.tasks.find_by(name: 'Revised name')).to be_valid
    end

    it 'Task should update if date is changed' do
      task = category.tasks.create( name: 'Test Task', task_date: Date.tomorrow())
      category.tasks.find_by(name: 'Test Task').update(task_date: Date.today())

      expect(category.tasks.find_by(name: 'Test Task').task_date).to eq(Date.today())
    end

  end

  context '#6: As a User, I want to view a task to show task\'s details.' do
    it 'Task details should be accessible once created' do
      task = category.tasks.create( name: 'Test Task', task_date: Date.tomorrow())

      expect(category.tasks.find(1)).to be_valid
      expect(category.tasks.find(1).task_date).to eq(Date.tomorrow())
      expect(category.tasks.find(1).name).to eq('Test Task')
    end
  end

  context '#7: As a User, I want to delete a task to lessen my unnecessary daily tasks.' do
    it 'Task should not be accessible once destroyed' do
      task = category.tasks.create( name: 'Test Task', task_date: Date.tomorrow())
      task.destroy 

      expect(category.tasks.find_by(name: 'Test Task')).to eq(nil)

    end
  end

  context '#8: As a User, I want to view my tasks for today for me to remind what are my priorities for today.' do
    it 'Display tasks based on day using where method' do
      category.tasks.create( name: 'Test Task 1', task_date: Date.tomorrow())
      category.tasks.create( name: 'Test Task 2', task_date: Date.tomorrow())
      category.tasks.create( name: 'Test Task 3', task_date: Date.today())

      expect(category.tasks.where(task_date: Date.tomorrow()).pluck(:name)).to include('Test Task 1', 'Test Task 2')
      expect(category.tasks.where(task_date: Date.tomorrow()).pluck(:name)).to_not include('Test Task 3')
    end
  end

  # context '#9: As a User, I want to create my account so that I can have my own credentials.' do

  # end

  # context '#10: As s User, I want to login my account so that I can access my account and link my own tasks.' do

  # end

end
