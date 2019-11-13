class RenameIconsDomainsToConcerns < ActiveRecord::Migration[6.0]
  def change
    rename_table :icons_domains, :concerns
  end
end
