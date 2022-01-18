class Difficulty < ApplicationRecord
  has_many :recipes, dependent: :restrict_with_exception

  DIFFICULTIES = ["très facile", "facile", "niveau moyen", "difficile"]

  validates :name, presence: true, inclusion: { in: DIFFICULTIES, allow_blank: false }, uniqueness: true

  before_save :downcase_name

  private
  def downcase_name
    name.downcase! unless name.nil?
  end
end
