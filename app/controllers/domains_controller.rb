class DomainsController < ApplicationController

  def index
    @campaign = @campaigns.find(params[:campaign_id])
    @domains = @campaign.domains.where.not(name: "Overall").includes(:icons)
  end

  def new
    @campaign = @campaigns.find(params[:campaign_id])
    @domain = Domain.new
  end

  def create
    @campaign = @campaigns.find(params[:campaign_id])
    @domain = @campaign.domains.create(domain_params)

    respond_with @domain, location: -> { [@campaign, :domains] }
  end

  def edit
    @campaign = @campaigns.find(params[:campaign_id])
    @domain = Domain.find(params[:id])
  end

  def update
    @campaign = @campaigns.find(params[:campaign_id])
    @domain = Domain.find(params[:id])
    @domain.update(domain_params)

    respond_with @domain, location: -> { [@campaign, :domains] }
  end

  private

  def domain_params
    params.require(:domain).permit(:name, :notes)
  end

end
