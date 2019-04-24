class SettingsController < ApplicationController
  def index
    @precinct_id = Setting['precinct_id']
    @precinct_string = @precinct_id.join(',')
    @canvasser_password = Setting['canvasser_password']
    @note = Setting['note']
  end

  def update
    @precinct_string = params[:precinct_id]
    Setting.precinct_id = @precinct_string.split(',').map(&:to_i)
    Setting.canvasser_password = params[:canvasser_password]
    Setting.note = params[:note]
    redirect_to settings_path
  end

  def delete_visits
    Visit.delete_all
    flash[:notice] = "All visit records deleted"
    redirect_to settings_path
  end

end
