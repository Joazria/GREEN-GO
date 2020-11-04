class BandController < ApplicationController
end

def article_params
  params.require(:band).permit(:name, :release, :website, :facebook, :instagram, :youtube, :spotify, :soundcloud, :email, :local, :team, :photo)
end

