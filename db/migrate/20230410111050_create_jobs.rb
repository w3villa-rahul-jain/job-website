class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :name
      t.string :description
      t.string :posts
      t.timestamps
    end
  end
end
