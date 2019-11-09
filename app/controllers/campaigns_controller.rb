class CampaignsController < ApplicationController

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = current_user.campaigns.new
    @campaign.create(campaign_params)

    respond_with @campaign
  end

  def edit
    @campaign = Campaign.find(params[:id])
  end

  def update
    @campaign = Campaign.find(params[:id])
    @campaign.update(campaign_params)

    respond_with @campaign
  end

  private

  def campaign_params
    params.require(:campaign).permit(:name, :description)
  end

end
