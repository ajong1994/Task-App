require 'rails_helper'

RSpec.describe Task, type: :feature do
  let!(:category) {Category.create(name: 'Test Category')}
  let!(:task) {category.tasks.create(name:'Sample Task', task_date: Date.today())}
  before do
    create(:user)
    visit new_user_session_path
    fill_in 'user_email', with: 'sample@example.com'
    fill_in 'user_password', with: 'Password'
    click_on ('Log in')
  end

  describe '#4 As a User, I want to create a task for a specific category so that I can organize tasks quicker.' do

    it 'On the /new path, inputting complete details should lead to a success message' do
        visit new_category_task_path(1)
        fill_in 'task_name', with: 'Another Sample Task'
        fill_in 'task_task_date', with: Date.today()
        click_on ('Create Task')
        expect(page).to have_content('Task was successfully created.')
    end

    it 'On the /new path, inputting missing name should lead to an error message' do
        visit new_category_task_path(1)
        fill_in 'task_task_date', with: Date.today()
        click_on ('Create Task')
        expect(page).to have_content('Name can\'t be blank')
    end

    it 'On the /new path, inputting missing date should lead to an error message' do
        visit new_category_task_path(1)
        fill_in 'task_name', with: 'Another Sample Task'
        click_on ('Create Task')
        expect(page).to have_content('Task date can\'t be blank')
    end
  end

  describe '#5: As a User, I want to edit a task to update task\'s details.' do
    it 'On the /edit path, editing Task Name should lead to a success message' do
        visit edit_category_task_path(1, 1)
        fill_in 'task_name', with: 'Sample Task 2'
        click_on ('Update Task')
        expect(page).to have_content('Task was successfully updated.')
        expect(page).to have_content('Sample Task 2')
    end

    it 'On the /edit path, editing Task Body should lead to a success message' do
        visit edit_category_task_path(1, 1)
        fill_in 'task_body', with: 'Placeholder Body'
        click_on ('Update Task')
        expect(page).to have_content('Task was successfully updated.')
        expect(page).to have_content('Sample Task')
        expect(page).to have_content('Placeholder Body')
    end

    it 'On the /edit path, editing Task Date should lead to a success message' do
        visit edit_category_task_path(1, 1)
        fill_in 'task_task_date', with: Date.tomorrow()
        click_on ('Update Task')
        expect(page).to have_content('Task was successfully updated.')
        expect(page).to have_content(Date.tomorrow())
    end

  end

  describe '#6: As a User, I want to view a task to show task\'s details.' do
    it 'When the user is on the category page, clicking the show link on any of the tasks should display the task\'s details' do
        visit category_path(1)
        click_on ('Show')
        expect(page).to have_content('Sample Task')
        expect(page).to have_content(Date.today())
        expect(find_link('Edit').visible?).to eq(true)
    end
  end

  describe '#7: As a User, I want to delete a task to lessen my unnecessary daily tasks.' do
    it 'Page should redirect and delete success message should display when delete button is clicked' do
        visit category_path(1)
        click_on ('Delete')
        expect(page).to have_content('Task was successfully destroyed.')
        expect(page).to have_content('Test Category')
        expect(find_link('New Task').visible?).to eq(true)
    end
  end

  describe '#8: As a User, I want to view my tasks for today for me to remind what are my priorities for today.' do
    it 'When accessing the category page, the tasks should be divided into tasks for today and non-urgent tasks' do
        visit category_path(1)
        expect(page).to have_content('Tasks Today')
        expect(page).to have_content(Date.today())
    end
  end

end
