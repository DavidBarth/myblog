class AddUserIdToArticles < ActiveRecord::Migration
  #in console: rails generate migration add_user_id_to_articles
  #will generate the this migration file where you define a change to the existing article table
  # rake db:migrate will update the db model
  def change
        add_column :articles, :user_id, :integer
  end
end
