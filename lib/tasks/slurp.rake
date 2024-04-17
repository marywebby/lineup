namespace :slurp do
  desc "Drops, creates, migrates, and adds sample data to database"
    task reset: [
      :environment,
      "db:drop",
      "db:create",
      "db:migrate"
    ]

  task type_of_products: :environment do
    require "csv"

    RoutineProduct.destroy_all
    ProductIngredient.destroy_all
    Product.destroy_all
    TypeOfProduct.destroy_all
    Ingredient.destroy_all

    csv_text = File.read(Rails.root.join("lib", "csvs", "type_of_products.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")

    csv.each do |row|
      top = TypeOfProduct.new
      top.name = row["name"]
      top.save
      puts "#{top.name} saved"
    end

    puts "There are now #{TypeOfProduct.count} rows in the type of products table"
  end

  task products: :environment do
    Product.destroy_all

    p1 = Product.new
    p1.name = "CeraVe Mosturizing Cream"
    p1.type_of_product_id = TypeOfProduct.find_by(name: "Moisturizter").id
    p1.photo_url = 'cerave-moist.png'
    p1.save
    puts "#{p1.name} saved"

    p2 = Product.new
    p2.name = "La Roche Posay Sunscreen"
    p2.type_of_product_id = TypeOfProduct.find_by(name: "Sunscreen").id
    p2.photo_url = 'laroce-moist.png'
    p2.save
    puts "#{p2.name} saved"

    p3 = Product.new
    p3.name = "Glow Recipe Watermelon Toner"
    p3.type_of_product_id = TypeOfProduct.find_by(name: "Toner").id
    p3.photo_url = 'glow-toner.png'
    p3.save
    puts "#{p3.name} saved"

    p4 = Product.new
    p4.name = "Good Molecules Yerbba Wake up Eye Gel"
    p4.type_of_product_id = TypeOfProduct.find_by(name: "Eye cream").id
    p4.photo_url = 'good-yerba.png'
    p4.save
    puts "#{p4.name} saved"

    p5 = Product.new
    p5.name = "Ordinary Niacinamide Serum"
    p5.type_of_product_id = TypeOfProduct.find_by(name: "Eye cream").id
    p5.photo_url = 'ordinary-niacinamide.png'
    p5.save
    puts "#{p5.name} saved"

    p6 = Product.new
    p6.name = "Laneige Water Sleeping Mask"
    p6.type_of_product_id = TypeOfProduct.find_by(name: "Overnight mask").id
    p6.photo_url = 'laneige-sleeping.png'
    p6.save
    puts "#{p6.name} saved"

    p7 = Product.new
    p7.name = "Panoxyl Foaming Face Wash"
    p7.type_of_product_id = TypeOfProduct.find_by(name: "Facewash").id
    p7.photo_url = 'panoxyl-facewash.png'
    p7.save
    puts "#{p7.name} saved"

    p8 = Product.new
    p8.name = "Nuetrogena Foaming Face Wash"
    p8.type_of_product_id = TypeOfProduct.find_by(name: "Facewash").id
    p8.photo_url = 'nuetrogena-gentle.png'
    p8.save
    puts "#{p8.name} saved"

    p9 = Product.new
    p9.name = "Elf Holy Hydration Eye Cream"
    p9.type_of_product_id = TypeOfProduct.find_by(name: "Eye cream").id
    p9.photo_url = 'elf-holy-eye.png'
    p9.save
    puts "#{p9.name} saved"

    p10 = Product.new
    p10.name = "CeraVe Skin Renewing Night Cream"
    p10.type_of_product_id = TypeOfProduct.find_by(name: "Night moisturizer").id
    p10.photo_url = 'cerave-renew-night.png'
    p10.save
    puts "#{p10.name} saved"

    p11 = Product.new
    p11.name = "Up&Up Facial Moisturizer with SPF"
    p11.type_of_product_id = TypeOfProduct.find_by(name: "Sunscreen").id
    p11.photo_url = 'up&up-spf-moist.png'
    p11.save
    puts "#{p11.name} saved"

    puts "There are now #{Product.count} rows in the products table"
  end

  task ingredients: :environment do
    require "csv"

    Ingredient.destroy_all

    csv_text = File.read(Rails.root.join("lib", "csvs", "ingredients.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")

    csv.each do |row|
      i = Ingredient.new
      i.name = row["name"]
      i.save
      puts "#{i.name} saved"
    end

    puts "There are now #{Ingredient.count} rows in the type of ingredients table"
  end

  task sample_data: [:environment] do
    if Rails.env.development?
      RoutineProduct.destroy_all
      Routine.destroy_all
      User.destroy_all

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
    puts "done adding sample data"
  end
end
