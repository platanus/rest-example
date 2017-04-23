class Order < ApplicationRecord
  extend Enumerize

  belongs_to :customer

  enumerize :status, in: [:pending, :processed, :expired], default: :pending
end
