desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  p "Creating sample data"

  if Rails.env.development?
    TypeOfProduct.destroy_all
    Ingredient.destroy_all
    Routine.destroy_all
    Product.destroy_all
    User.destroy_all
  end

  10.times do
    name = Faker::Name.first_name
    User.create(
      email: "#{name}@example.com",
      password: "password",
      username: name,
    )
  end

  p "There are now #{User.count} users."
end
