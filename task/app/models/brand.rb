class Brand < ApplicationRecord
    validates :name, presence: true
    validates :redemption, presence: true, inclusion: { in: %w(online instore) }
end
