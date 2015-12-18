require 'securerandom'

class UrlsController < ApplicationController
  def index
    @url = Url.new
    @urls = Url.all
  end

  def create
    @url = Url.new(url_params)
    @url.short_partial_url = SecureRandom.hex(3)
    @url.save

    redirect_to urls_path
  end

  def show
    #remove the leading slash
    @short_partial_url = request.original_fullpath[1..-1]
    @url = Url.find_by(short_partial_url: @short_partial_url)
    redirect_to @url.long_url, status: 301, turbolinks: false
  end

  private
  def url_params
    params.require(:url).permit(:long_url)
  end
end
