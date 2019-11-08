require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  before_action :authenticate_user!
  before_action :load_campaigns

  private

  def load_campaigns
    @campaign_menu = current_user&.campaigns || Campaign.none
  end

end
