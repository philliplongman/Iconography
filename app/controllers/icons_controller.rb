class IconsController < ApplicationController

  def index
    @campaign = Campaign.find(params[:campaign_id])
    @age_icons = @campaign.icons
  end

  def show
    @campaign = Campaign.find(params[:campaign_id])
    @age_icon = Icon.find(params[:id])
  end

  def new
    @campaign = Campaign.find(params[:campaign_id])
    @age_icon = Icon.new
  end

  def create
    @campaign = Campaign.find(params[:campaign_id])
    @age_icon = @campaign.icons.create(icon_params)

    respond_with @age_icon, location: -> { campaign_icons_path @campaign }
  end

  def edit
    @campaign = Campaign.find(params[:campaign_id])
    @age_icon = Icon.find(params[:id])
  end

  def update
    @campaign = Campaign.find(params[:campaign_id])
    @age_icon = Icon.find(params[:id])
    @age_icon.update(icon_params)

    respond_with @campaign, @age_icon
  end

  def destroy
    @campaign = Campaign.find(params[:campaign_id])
    @age_icon = Icon.find(params[:id]).destroy

    respond_with @age_icon, location: -> { campaign_icons_path @campaign }
  end

  private

  def icon_params
    params.require(:icon).permit(
      :adventurers, :allies, :common_knowledge, :enemies, :history, :id, :name,
      :quote, :summary, :true_danger, :usual_location
    )
  end

end
