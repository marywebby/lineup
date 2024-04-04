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
  users.append(User.create(username: "charlie", email: "charlie@example.com", password: "password"))
  users.append(User.create(username: "dave", email: "dave@example.com", password: "password"))
  users.append(User.create(username: "eve", email: "eve@example.com", password: "password"))

  sample_routine_names = ["Morning Routine", "Evening Routine", "Weekend Routine"]
  product_ids = Product.pluck(:id)

  users.each do |user|
    created_routine_names = []

    sample_routine_names.each do |routine_name|
      unless user.routines.exists?(name: routine_name)
        user.routines.create(name: routine_name)
        created_routine_names << routine_name
      end
    end

    created_routine_names.each do |routine_name|
      routine = user.routines.find_by(name: routine_name)
      products_in_routine = []

      rand(4..5).times do
        product_id = product_ids.sample

        unless products_in_routine.include?(product_id)
          routine.routine_products.create(product_id: product_id)
          products_in_routine << product_id
        end
      end
    end
  end
end
