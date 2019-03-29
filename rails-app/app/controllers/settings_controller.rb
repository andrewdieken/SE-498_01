class SettingsController < ApplicationController
  def index
    @precinct_id = Setting['precinct_id']
  end

  def update
    Setting.precinct_id = params[:precinct_id]
    redirect_to settings_path
  end

end
