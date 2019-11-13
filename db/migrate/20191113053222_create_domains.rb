class CreateDomains < ActiveRecord::Migration[6.0]
  def change
    create_table :domains do |t|
      t.string :name
      t.belongs_to :campaign, null: false, foreign_key: { on_delete: :cascade }
      t.index [:name, :campaign_id], unique: true
    end

    create_table :icons_domains do |t|
      t.belongs_to :icon, null: false, foreign_key: { on_delete: :cascade }
      t.belongs_to :domain, null: false, foreign_key: { on_delete: :cascade }
      t.index [:icon_id, :domain_id], unique: true
    end
  end
end
