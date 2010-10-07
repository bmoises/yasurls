class ShortUrlsController < ApplicationController
  def index
    @long_link = params['long_link']
    @short_link = params['short_link']
    
  end

  def create
    short = params['shorten']
    # if the url does not exist in database, create it.
    # otherwise return the one in database
    @tinyurl = Url.find_by_long_link(short['url'])
    if !@tinyurl
      @tinyurl = Url.derive_short_url(short['url'])
    end
    @host = "http://#{request.env['HTTP_HOST']}/"
  end

  def redirect
    @tinyurl = Url.find_by_short_link(params['short_link'])
    if @tinyurl
      @tinyurl.increment_times_accessed!
      redirect_to @tinyurl.long_link
    else
      flash[:notice] = "Url #{request.env['REQUEST_URI']} does not exist, go ahead and create a url"
      redirect_to :controller => 'short_urls', :action => 'index'
    end
  end

end
