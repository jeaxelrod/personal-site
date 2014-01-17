class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :contents
      t.string :title
      t.string :tags

      t.timestamps
    end
  end
end
