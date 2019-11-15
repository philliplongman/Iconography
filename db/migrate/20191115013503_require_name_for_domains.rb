class RequireNameForDomains < ActiveRecord::Migration[6.0]
  def change
    change_column_null :domains, :name, false
  end
end
