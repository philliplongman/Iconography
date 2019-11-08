class CreateIcons < ActiveRecord::Migration[6.0]
  def change
    create_table :icons do |t|
      t.string :name, null: false
      t.string :blurb, limit: 1000
      t.text :description
      t.belongs_to :campaign, null: false, foreign_key: { on_delete: :cascade }
      t.index [:name, :campaign_id], unique: true
      t.timestamps
    end
  end
end
