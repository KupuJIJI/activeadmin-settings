class ActiveadminSettings::SettingsController < ApplicationController
  before_filter :authenticate_admin_user!

  def update
    @object = ActiveadminSettings::Setting.find(params[:id])
    if @object.update_attributes(permit)
      render :text => @object.value
    else
      render :text => "error"
    end
  end

  private

  def permit
    params.require(:setting).permit!
  end
end