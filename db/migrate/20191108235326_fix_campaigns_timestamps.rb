class FixCampaignsTimestamps < ActiveRecord::Migration[6.0]
  def change
    remove_column :campaigns, :timestamps, :string
    add_timestamps :campaigns
  end
end
