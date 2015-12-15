class UrlsController < ApplicationController
  def index
    @url = Url.new
    @urls = Url.all
  end

  def create
    @url = Url.new(url_params)
    @url.save
    redirect_to urls_path
  end

  private
  def url_params
    params.require(:url).permit(:long_url)
  end
end
