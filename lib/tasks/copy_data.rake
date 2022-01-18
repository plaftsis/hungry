require 'csv'

namespace :copy do
  desc "imports authors"
  task :authors => :environment do
    authors = []
    CSV.foreach('data/tables/authors.csv', headers: true) do |row|
      authors << row.to_hash
    end
    time = Time.now.getutc

    Author.copy_from_client [:name, :created_at, :updated_at] do |copy|
      authors.each do |d|
        copy << [d["name"], time, time]
      end
    end
  end

  desc "imports difficulties"
  task :difficulties => :environment do
    difficulties = []
    CSV.foreach('data/tables/difficulties.csv', headers: true) do |row|
      difficulties << row.to_hash
    end
    time = Time.now.getutc

    Difficulty.copy_from_client [:name, :created_at, :updated_at] do |copy|
      difficulties.each do |d|
        copy << [d["name"], time, time]
      end
    end
  end

  desc "imports budgets"
  task :budgets => :environment do
    budgets = []
    CSV.foreach('data/tables/budgets.csv', headers: true) do |row|
      budgets << row.to_hash
    end
    time = Time.now.getutc

    Budget.copy_from_client [:name, :created_at, :updated_at] do |copy|
      budgets.each do |d|
        copy << [d["name"], time, time]
      end
    end
  end

  desc "imports recipes"
  task :recipes => :environment do
    recipes = []
    CSV.foreach('data/tables/recipes.csv', headers: true) do |row|
      recipes << row.to_hash
    end
    time = Time.now.getutc

    Recipe.copy_from_client [:name, :rate, :people_quantity,
                             :prep_time_in_minutes, :cook_time_in_minutes, :total_time_in_minutes,
                             :image, :number_of_comments,
                             :author_id, :difficulty_id, :budget_id,
                             :created_at, :updated_at] do |copy|
      recipes.each do |d|
        copy << [d["name"], d["rate"].to_f, d["people_quantity"].to_i,
                 d["prep_time_in_minutes"].to_i, d["cook_time_in_minutes"].to_i, d["total_time_in_minutes"].to_i,
                 d["image"], d["number_of_comments"].to_i,
                 d["author_id"].to_i, d["difficulty_id"].to_i, d["budget_id"].to_i,
                 time, time]
      end
    end
  end

  desc "imports ingredients"
  task :ingredients => :environment do
    ingredients = []
    CSV.foreach('data/tables/ingredients.csv', headers: true) do |row|
      ingredients << row.to_hash
    end
    time = Time.now.getutc

    Ingredient.copy_from_client [:name, :created_at, :updated_at] do |copy|
      ingredients.each do |d|
        copy << [d["name"], time, time]
      end
    end
  end

  desc "imports tags"
  task :tags => :environment do
    tags = []
    CSV.foreach('data/tables/tags.csv', headers: true) do |row|
      tags << row.to_hash
    end
    time = Time.now.getutc

    Tag.copy_from_client [:name, :created_at, :updated_at] do |copy|
      tags.each do |d|
        copy << [d["name"], time, time]
      end
    end
  end

  desc "imports recipes_ingredients"
  task :recipes_ingredients => :environment do
    conn = ActiveRecord::Base.connection
    rc = conn.raw_connection
    rc.exec('COPY recipes_ingredients(recipe_id, ingredient_id) FROM STDIN WITH CSV')

    # skip header
    File.readlines('data/tables/recipes_ingredients.csv').drop(1).each do |line|
      rc.put_copy_data(line)
    end

    rc.put_copy_end
  end

  desc "imports recipes_tags"
  task :recipes_tags => :environment do
    conn = ActiveRecord::Base.connection
    rc = conn.raw_connection
    rc.exec('COPY recipes_tags(recipe_id, tag_id) FROM STDIN WITH CSV')

    # skip header
    File.readlines('data/tables/recipes_tags.csv').drop(1).each do |line|
      rc.put_copy_data(line)
    end

    rc.put_copy_end
  end
end
