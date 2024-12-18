class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.string :body
      t.datetime :completed_at

      t.timestamps
    end
  end
end
