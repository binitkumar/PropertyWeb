class UsersController < ApplicationController
  def change_language
    cookies[:language] = params[:id]
    redirect_to :back
  end
end
