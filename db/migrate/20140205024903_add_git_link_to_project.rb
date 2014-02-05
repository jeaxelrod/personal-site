class AddGitLinkToProject < ActiveRecord::Migration
  def change
    add_column :projects, :gitlink, :string
  end
end
