class CreateWords < ActiveRecord::Migration[6.0]
  def change
    create_table :words do |t|
      t.boolean :status, default: false
      t.string :content

      t.timestamps
    end
  end
end
