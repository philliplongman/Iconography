class IconsController < ApplicationController

  def index
    @campaign = Campaign.find(params[:campaign_id])
    @age_icons = @campaign.icons.sorted
  end

end
