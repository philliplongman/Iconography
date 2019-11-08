class CampaignsController < ApplicationController

  def show
    @campaign = Campaign.find(params[:id])
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = current_user.campaigns.create(campaign_params)
    respond_with @campaign
  end

  private

  def campaign_params
    params.require(:campaign).permit(:name, :description)
  end

end
