desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do

  if Rails.env.development?
    RoutineProduct.destroy_all
    Routine.destroy_all
  end

  # 10.times do
  #   name = Faker::Name.first_name
  #   User.create(
  #     email: "#{name}@example.com",
  #     password: "password",
  #     username: name,
  #   )
  # end

  p "Creating sample data"

  users = User.all

  # Define arrays of sample routine names and product IDs
  sample_routine_names = ["Morning Routine", "Evening Routine", "Weekend Routine"]
  product_ids = Product.pluck(:id)

  users.each do |user|
    # Create random number of routines for each user (between 1 and 3)
    rand(1..3).times do
      routine = user.routines.create(name: sample_routine_names.sample)

      # Randomly assign routine products (between 1 and 5 products per routine)
      rand(1..5).times do
        # Choose a random product ID
        product_id = product_ids.sample

        # Create a routine product
        routine.routine_products.create(product_id: product_id)
      end
    end
  end
end
