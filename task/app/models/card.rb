class Card < ApplicationRecord
  belongs_to :product
  validates :status, inclusion: { in: ['available', 'issued'] }
  validates_uniqueness_of :activation_number

  before_validation :generate_activation_number, on: :create

  private

  def generate_activation_number
    self.activation_number = loop do
      # Generate a random activation number here
      random_activation_number = rand(100_000..999_999)
      break random_activation_number unless Card.exists?(activation_number: random_activation_number)
    end
  end
end
