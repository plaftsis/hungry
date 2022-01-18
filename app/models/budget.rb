class Budget < ApplicationRecord
  has_many :recipes, dependent: :restrict_with_exception

  BUDGETS =["bon marché", "coût moyen", "assez cher"]

  validates :name, presence: true, inclusion: { in: BUDGETS, allow_blank: false }, uniqueness: true

  before_save :downcase_name

  private
  def downcase_name
    name.downcase! unless name.nil?
  end
end
