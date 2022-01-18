class RecipeSerializer < ApplicationSerializer
  attributes :id, :name, :rate, :people_quantity, :prep_time, :cook_time, :total_time, :image, :number_of_comments

  belongs_to :author
  belongs_to :difficulty
  belongs_to :budget
  has_many :tags
  has_many :ingredients

  def prep_time
    Duration.humanize(object.prep_time_in_minutes)
  end

  def cook_time
    Duration.humanize(object.prep_time_in_minutes)
  end

  def total_time
    Duration.humanize(object.prep_time_in_minutes)
  end
end
