class Url < ActiveRecord::Base

  class << self
    def derive_short_url(url)
      # first determine what the short code will be
      #url = Url.new(:long_link => url,  :short_link => 'a1b2c3')
      url = Url.new(:long_link => url)
      # save
      url.save

      url.short_link = url.id
      url.save
      url
    end
  end
end
