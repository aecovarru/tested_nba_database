class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.references :intervalable, polymorphic: true, index: true
      t.belongs_to :team
      t.string :name
      t.string :abbr
      t.string :idstr
    end
  end
end
