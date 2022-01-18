class Author < ApplicationRecord
  has_many :recipes, dependent: :restrict_with_exception

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
