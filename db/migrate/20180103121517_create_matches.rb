class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.date :day
      t.string :matches, array:true

      t.timestamps
    end
  end
end
