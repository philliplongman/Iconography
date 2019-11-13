class CampaignsController < ApplicationController

  def show
    redirect_to campaign_graph_path(campaign_id: params[:id])
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = @campaigns.create(campaign_params)

    respond_with @campaign
  end

  def edit
    @campaign = @campaigns.find(params[:id])
  end

  def update
    @campaign = @campaigns.find(params[:id])
    @campaign.update(campaign_params)

    respond_with @campaign
  end

  private

  def campaign_params
    params.require(:campaign).permit(:name, :description)
  end

end
