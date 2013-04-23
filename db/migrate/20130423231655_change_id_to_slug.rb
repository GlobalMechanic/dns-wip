class ChangeIdToSlug < ActiveRecord::Migration
  def up
    add_column :pages, :slug, :string
    remove_column :pages, :id
  end

  def down
    add_column :pages, :id, :primary_key
    remove_column :pages, :slug
  end
end
