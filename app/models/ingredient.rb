class Ingredient < ApplicationRecord
  include PgSearch::Model

  has_and_belongs_to_many :recipes, :join_table => :recipes_ingredients, dependent: :restrict_with_exception

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  pg_search_scope :search_name,
                  against: :name,
                  using: { tsearch: { dictionary: 'french', tsvector_column: 'searchable' } }
end
