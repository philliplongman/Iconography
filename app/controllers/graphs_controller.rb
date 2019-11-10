class GraphsController < ApplicationController

  def show
    @campaign = Campaign.find(params[:campaign_id])
  end

end
