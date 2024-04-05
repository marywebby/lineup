namespace :slurp do
  desc "TODO"

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
    # require "csv"
    # csv_text = File.read(Rails.root.join("lib", "csvs", "products.csv"))
    # csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    Product.destroy_all

    p1 = Product.new
    p1.name = "CeraVe Mosturizing Cream"
    p1.type_of_product_id = TypeOfProduct.find_by(name: "Moisturizter").id
    p1.save
    puts "#{p1.name} saved"

    p2 = Product.new
    p2.name = "La Roche Posay Sunscreen"
    p2.type_of_product_id = TypeOfProduct.find_by(name: "Sunscreen").id
    p2.save
    puts "#{p2.name} saved"

    p3 = Product.new
    p3.name = "Glow Recipe Watermelon Toner"
    p3.type_of_product_id = TypeOfProduct.find_by(name: "Toner").id
    p3.save
    puts "#{p3.name} saved"

    p4 = Product.new
    p4.name = "Good Molecules Yerbba Wake up Eye Gel"
    p4.type_of_product_id = TypeOfProduct.find_by(name: "Eye cream").id
    p4.save
    puts "#{p4.name} saved"

    p5 = Product.new
    p5.name = "Ordinary Niacinamide Serum"
    p5.type_of_product_id = TypeOfProduct.find_by(name: "Eye cream").id
    p5.save
    puts "#{p5.name} saved"

    p6 = Product.new
    p6.name = "Laneige Water Sleeping Mask"
    p6.type_of_product_id = TypeOfProduct.find_by(name: "Overnight mask").id
    p6.save
    puts "#{p6.name} saved"

    p7 = Product.new
    p7.name = "Panoxyl Foaming Face Wash"
    p7.type_of_product_id = TypeOfProduct.find_by(name: "Facewash").id
    p7.save
    puts "#{p7.name} saved"

    p8 = Product.new
    p8.name = "Nuetrogena Foaming Face Wash"
    p8.type_of_product_id = TypeOfProduct.find_by(name: "Facewash").id
    p8.save
    puts "#{p8.name} saved"

    p9 = Product.new
    p9.name = "Elf Holy Hydration Eye Cream"
    p9.type_of_product_id = TypeOfProduct.find_by(name: "Eye cream").id
    p9.save
    puts "#{p9.name} saved"

    p10 = Product.new
    p10.name = "CeraVe Skin Renewing Night Cream"
    p10.type_of_product_id = TypeOfProduct.find_by(name: "Night moisturizer").id
    p10.save
    puts "#{p10.name} saved"

    p11 = Product.new
    p11.name = "Up&Up Facial Moisturizer with SPF"
    p11.type_of_product_id = TypeOfProduct.find_by(name: "Sunscreen").id
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

  # task product_ingredients: :environment do
  # end

end
