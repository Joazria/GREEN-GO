class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home

    if params[:query].present?
      @bands = Band.search_by_name(params[:query])
    else
      @bands = Band.all
    end
  end

  def about_us
    @bands = Band.all
  end

    def profile
    @bands = Band.includes(:offers).where(offers: { user_id: current_user.id })
  end


end
