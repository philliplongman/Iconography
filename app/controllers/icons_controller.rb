class IconsController < ApplicationController

  def index
    @campaign = Campaign.find(params[:campaign_id])
    @icons = @campaign.icons.sorted
  end

end
