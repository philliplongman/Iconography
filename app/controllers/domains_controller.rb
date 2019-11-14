class DomainsController < ApplicationController

  def index
    @campaign = @campaigns.find(params[:campaign_id])
    @domains = @campaign.domains.where.not(name: "Overall").includes(:icons)
  end

end
