class AddNotesToDomainsAndConcerns < ActiveRecord::Migration[6.0]
  def change
    add_column :domains, :notes, :text
    add_column :concerns, :notes, :text
  end
end
