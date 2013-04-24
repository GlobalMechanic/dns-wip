class AddUniqueToSlug < ActiveRecord::Migration
  def up
    add_index :pages, :slug, :unique => true
  end

  def down
    remove_index :pages, :slug
  end
end
