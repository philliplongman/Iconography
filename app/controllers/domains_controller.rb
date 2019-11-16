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

    respond_with @domain, location: -> { campaign_domains_path @campaign }
  end

  def edit
    @campaign = @campaigns.find(params[:campaign_id])
    @domain = Domain.find(params[:id])
  end

  def update
    @campaign = @campaigns.find(params[:campaign_id])
    @domain = Domain.find(params[:id])
    @domain.update(domain_params)

    respond_with @domain, location: -> { campaign_domains_path @campaign }
  end

  def destroy
    @campaign = Campaign.find(params[:campaign_id])
    @domain = Domain.find(params[:id]).destroy

    respond_with @domain, location: -> { campaign_domains_path @campaign }
  end

  private

  def domain_params
    params.require(:domain).permit(:name, :notes, icon_ids: [])
  end

end
