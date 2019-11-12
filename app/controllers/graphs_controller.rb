class GraphsController < ApplicationController

  def show
    @campaign = @campaigns.find(params[:campaign_id])
  end

end
