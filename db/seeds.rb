# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ActiveRecord::Base.transaction do
  puts "Creating Funds..."

  2.times do |t|
    Fund.create!(name: "test-fund-#{t}", tg_bot_key: "test-tg-bot-key-#{t}")
  end

  puts "Creating Storages..."

  Storage.create!(
    fund: Fund.first,
    name: "test-storage-1",
    geom: "0101000020E61000007DFEF2C60EFC3A406907E52A76B64840",
    country: "Ukraine",
    city: "Kyiv",
    street: "Victory avenue",
    postal_code: "31342",
    house_number: "69"
  )

  Storage.create!(
    fund: Fund.second,
    name: "test-storage-2",
    geom: "0101000020E61000007DFEF2C60EFC3A406907E52A76B64840",
    country: "Ukraine",
    city: "Kyiv",
    street: "Victory avenue",
    postal_code: "42069",
    house_number: "666"
  )

  puts "Creating Categories..."

  10.times do |t|
    Category.create!(
      name: "test-product-category-#{t}",
      image_url: "test-product-category-image-url-#{t}"
    )
  end

  puts "Creating Products and Availabilities..."

  100.times do |t|
    product = Product.create!(
      category: Category.all.sample,
      name: "test-product-#{t}",
      weight: rand(100),
      height: rand(10),
      width: rand(10),
      length: rand(10)
    )

    ProductAvailability.create!(
      product: product,
      storage: Storage.all.sample,
      quantity: rand(20)
    )
  end

  puts "Creating Customers..."

  100.times do |t|
    Customer.create!(
      name: "test-customer-#{t}"
    )
  end

  puts "Creating Drivers..."

  10.times do |t|
    Driver.create!(
      login: "test-driver-#{t}",
      encrypted_password: "rand-string-#{t}",
      online: true,
      last_online: Time.now,
    )
  end

  puts "Creating Deliveries..."

  1000.times do |t|
    Delivery.create!(
      driver: Driver.all.sample,
      route: {
        first_point: 'Kyiv',
        second_point: 'Lviv'
      },
      status: %i[inactive completed].sample
    )
  end

  puts "Creating Active Deliveries..."

  Driver.all.each do |driver|
    driver.deliveries.sample.active!
  end

  puts "Creating Customer Orders..."

  Customer.all.each do |customer|
    10.times do |t|
      cart = Cart.create!(
        customer: customer
      )

      CustomerOrder.create!(
        customer: customer,
        route: {
          first_point: 'Kyiv',
          last_point: 'Lviv'
        },
        status: %i[composed active completed].sample,
        cart: cart,
        geom: "0101000020E61000007DFEF2C60EFC3A406907E52A76B64840",
        country: "Ukraine",
        city: "Kyiv",
        street: "Victory avenue",
        postal_code: "42069",
        house_number: "#{t}"
      )
    end
  end

  puts "Creating Carts..."

  Customer.all.sample(10).each(&:create_cart!)

  puts "Creating Cart Items..."

  begin
    storage = Storage.all.sample

    Cart.all.each do |cart|
      5.times do |t|
        product = storage.products.sample
        redo if cart.cart_items.pluck(:product_id).include? product.id


        quantity = rand product.product_availabilities.find_by(storage: storage).quantity

        CartItem.create!(
          cart: cart,
          product: product,
          quantity: quantity
        )
      end
    end
  end

  puts "Creating Delivery Items..."

  begin
    5.times do
      cart = CustomerOrder.active.sample.cart

      5.times do
        delivery = Delivery.active.sample

        5.times do |t|
          status = %i[active completed].sample
          status = delivery.status unless delivery.active?

          cart_item = cart.cart_items.sample
          product_availability = ProductAvailability.find_by(product: cart_item.product)
          quantity = rand product_availability.quantity

          DeliveryItem.create!(
            delivery: delivery,
            cart_item: cart_item,
            product_availability: product_availability,
            quantity: quantity,
            outdated: ([false] * 9 + [true]).sample,
            status: status
          )
        end
      end
    end

    5.times do
      delivery = Delivery.active.sample

      5.times do
        cart = CustomerOrder.active.sample.cart

        5.times do |t|
          status = %i[active completed].sample
          status = delivery.status unless delivery.active?

          cart_item = cart.cart_items.sample
          product_availability = ProductAvailability.find_by(product: cart_item.product)
          quantity = rand product_availability.quantity

          DeliveryItem.create!(
            delivery: delivery,
            cart_item: cart_item,
            product_availability: product_availability,
            quantity: quantity,
            outdated: ([false] * 9 + [true]).sample,
            status: status
          )
        end
      end
    end
  end
end
