module FakeDataLoader
  def self.load_data
    Customer.destroy_all
    Order.destroy_all
    Item.destroy_all
    load_customers
  end

  def self.load_customers
    200.times.each do
      customer = Customer.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email
      )

      load_orders(customer)
    end
  end

  def self.load_orders(customer)
    [*0..20].sample.times.each do
      order = customer.orders.create!(status: [:pending, :processed, :expired].sample)
      load_items(order)
    end
  end

  def self.load_items(order)
    [*5..20].sample.times.each do
      order.items.create!(
        name: Faker::Food.ingredient,
        description: Faker::Lorem.sentence,
        quantity: [*1..5].sample,
        price: [*999..999999].sample
      )
    end
  end
end
