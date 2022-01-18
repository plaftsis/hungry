class Tag < ApplicationRecord
  has_and_belongs_to_many :recipes, :join_table => :recipes_tags, dependent: :restrict_with_exception

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
