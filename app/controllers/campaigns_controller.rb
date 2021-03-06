class CampaignsController < ApplicationController

  def show
    redirect_to campaign_graph_path(campaign_id: params[:id])
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = current_user.campaigns.create(campaign_params)

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

  def destroy
    @campaign = Campaign.find(params[:id]).destroy

    respond_with @campaign, location: -> { root_path }
  end

  def relationships
    id = params[:campaign_id]
    domain = Domain.find_by(campaign_id: id, name: "Overall")
    redirect_to campaign_domain_relationships_path(id, domain.id)
  end

  private

  def campaign_params
    params.require(:campaign).permit(:name, :description)
  end

end
