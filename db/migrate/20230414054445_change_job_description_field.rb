class ChangeJobDescriptionField < ActiveRecord::Migration[6.1]
  def change
    change_column :jobs, :description, :text
  end
end
