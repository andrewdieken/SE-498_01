class SettingsController < ApplicationController
  def index
    @precinct_id = Setting['precinct_id']
    @canvasser_password = Setting['canvasser_password']
  end

  def update
    Setting.precinct_id = params[:precinct_id]
    Setting.canvasser_password = params[:canvasser_password]
    redirect_to settings_path
  end

end
