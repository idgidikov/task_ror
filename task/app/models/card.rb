# app/models/card.rb
class Card < ApplicationRecord
  belongs_to :product
  has_one :issued_transaction, class_name: 'Transaction', foreign_key: 'card_id'

  validates :status, inclusion: { in: ['available', 'issued'] }
  validates_uniqueness_of :activation_number

  before_validation :generate_activation_number, on: :create

  before_save :create_transaction, if: :issued?

  private

  def issued?
    status == 'issued'
  end

  def generate_activation_number
    self.activation_number = loop do
      random_activation_number = rand(100_000..999_999)
      break random_activation_number unless Card.exists?(activation_number: random_activation_number)
    end
  end

  def create_transaction
    transaction = Transaction.new(
      amount: amount,
      reference_number: "TXN-#{SecureRandom.hex(4)}",
      card_id: id  # Include the card_id in the transaction
    )
  
    # Save the transaction
    transaction.save
  end
  
end
