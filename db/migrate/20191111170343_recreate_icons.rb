class RecreateIcons < ActiveRecord::Migration[6.0]
  def up
    # I'm doing this exclusively for schema readability,
    # since there is no real data, and nothing has been deployed.
    drop_table :icons

    create_table :icons do |t|
      t.belongs_to :campaign, null: false, foreign_key: { on_delete: :cascade }
      t.string :name, null: false
      t.string :summary, limit: 1000
      t.column :quote, :string
      t.column :usual_location, :text
      t.column :common_knowledge, :text
      t.column :adventurers, :text
      t.column :allies, :text
      t.column :enemies, :text
      t.column :history, :text
      t.column :true_danger, :text
      t.index [:name, :campaign_id], unique: true
      t.timestamps
    end
  end

  def down
    drop_table :icons

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
