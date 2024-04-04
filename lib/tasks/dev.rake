desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do

  if Rails.env.development?
    RoutineProduct.destroy_all
    Routine.destroy_all
    User.destroy_all
  end

  # users, products, ingredients, and chemicals already created and hardcoded, running `rake sample_data` will destroy the RoutineProduct table and Routine table

  p "Creating sample data"
  users = []

  users.append(User.create(username: "alice", email: "alice@example.com", password: "password"))
  users.append(User.create(username: "bob", email: "bob@example.com", password: "password"))

  users = User.all

  sample_routine_names = ["Morning Routine", "Evening Routine", "Weekend Routine"]
  product_ids = Product.pluck(:id)

  users.each do |user|
    rand(1..3).times do
      routine = user.routines.create(name: sample_routine_names.sample)

      rand(1..5).times do
        product_id = product_ids.sample

        routine.routine_products.create(product_id: product_id)
      end
    end
  end
end
