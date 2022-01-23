class Recipe < ApplicationRecord
  belongs_to :author
  belongs_to :difficulty
  belongs_to :budget
  has_and_belongs_to_many :tags, join_table: :recipes_tags
  has_and_belongs_to_many :ingredients, join_table: :recipes_ingredients

  validates :name, :people_quantity, :prep_time_in_minutes, :cook_time_in_minutes, presence: true
  validates :people_quantity, numericality: { greater_than: 0, less_than_or_equal_to: 500 }
  validates :rate, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

  before_save :set_total_time

  private

  def set_total_time
    self.total_time_in_minutes = prep_time_in_minutes + cook_time_in_minutes
  end
end
