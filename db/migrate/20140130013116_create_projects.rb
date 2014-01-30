class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :link
      t.string :description
      t.string :name

      t.timestamps
    end
  end
end
