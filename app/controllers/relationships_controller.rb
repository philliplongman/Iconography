class RelationshipsController < ApplicationController

  def index
    @campaign = @campaigns.find(params[:campaign_id])
    @domain = @campaign.domains.find(params[:domain_id])
    @relationships = @domain.relationships.includes(:icons)
  end

  def new
    @campaign = @campaigns.find(params[:campaign_id])
    @domain = @campaign.domains.find(params[:domain_id])
    @relationship = Relationship.new
  end

  def create
    @campaign = @campaigns.find(params[:campaign_id])
    @domain = @campaign.domains.find(params[:domain_id])
    @relationship = @domain.relationships.find_or_initialize_by(
      icons: relationship_params[:icon_ids]
    )
    @relationship.update(relationship_params)

    respond_with @relationship,
      location: -> { campaign_domain_relationships_path(@campaign, @domain) }
  end

  def edit
    @campaign = @campaigns.find(params[:campaign_id])
    @domain = @campaign.domains.find(params[:domain_id])
    @relationship = @domain.relationships.find(params[:id])
  end

  def update
    @campaign = @campaigns.find(params[:campaign_id])
    @domain = @campaign.domains.find(params[:domain_id])
    @relationship = @domain.relationships.find(params[:id])
    @relationship.update(relationship_params)

    respond_with @relationship,
      location: -> { campaign_domain_relationships_path(@campaign, @domain) }
  end

  def destroy
    @campaign = @campaigns.find(params[:campaign_id])
    @domain = @campaign.domains.find(params[:domain_id])
    @relationship = @domain.relationships.find(params[:id])
    @relationship.destroy

    respond_with @relationship,
      location: -> { campaign_domain_relationships_path(@campaign, @domain) }
  end

  private

  def relationship_params
    params.require(:relationship).permit(:attitude, :major, :notes, icon_ids: [])
  end

end
