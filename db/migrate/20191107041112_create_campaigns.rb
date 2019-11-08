class CreateCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :campaigns do |t|
      t.string :name, null: false
      t.text :description
      t.belongs_to :user, null: false, foreign_key: { on_delete: :cascade }
      t.string :timestamps
      t.index [:name, :user_id], unique: true
    end
  end
end
