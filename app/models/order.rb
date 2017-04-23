class Order < ApplicationRecord
  extend Enumerize

  belongs_to :customer
  has_many :items

  enumerize :status, in: [:pending, :processed, :expired], default: :pending
end
