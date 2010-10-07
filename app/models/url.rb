class Url < ActiveRecord::Base

  class << self
    def derive_short_url(url)
      # first we save to get the record id and use that to determine what the
      # short url will be
      url = Url.new(:long_link => url)
      # save
      url.save
      # TODO: not as efficient b/c we have to save twice...fix this :)
      url.short_link = NumToBase.toBaseN(url.id)
      url.save
      url
    end

    # We override this method to ensure that we do a binary search so that "b" != "B"
    def find_by_short_link(url)
      (Url.find_by_sql ["SELECT * FROM urls WHERE short_link = BINARY ? LIMIT 1",url]).first
    end

  end
  # increment the number of times url was accessed
  def increment_times_accessed!
    self.update_attributes!({:times_accessed => self.times_accessed+1})
  end
end
