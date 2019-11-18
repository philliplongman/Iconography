class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.belongs_to :domain, null: false, foreign_key: { on_delete: :cascade }
      t.integer :attitude, null: false
      t.boolean :major, null: false, default: true
      t.text :notes
      t.timestamps
    end

    create_table :icons_relationships do |t|
      t.belongs_to :relationship, null: false, foreign_key: { on_delete: :cascade }
      t.belongs_to :icon, null: false, foreign_key: { on_delete: :cascade }
      t.index [:relationship_id, :icon_id], unique: true
      t.timestamps
    end
  end
end
