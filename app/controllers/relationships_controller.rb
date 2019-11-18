class RelationshipsController < ApplicationController

  def index
    @campaign = @campaigns.find(params[:campaign_id])
    @domain = Domain.find(params[:domain_id])
    @relationships = @domain.relationships.includes(:icons)
  end

end
