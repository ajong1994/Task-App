class Task < ApplicationRecord
    validates :category_id, presence: true
    validates :name, presence: true,
                    uniqueness: true
    validates :task_date, presence: true
    belongs_to :category
end
