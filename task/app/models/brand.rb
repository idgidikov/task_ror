class Brand < ApplicationRecord
    has_many :products, dependent: :destroy
    validates :name, presence: true
    validates :active, inclusion: { in: [true, false] }
    validates :redemption, presence: true, inclusion: { in: %w(online instore) }
end
