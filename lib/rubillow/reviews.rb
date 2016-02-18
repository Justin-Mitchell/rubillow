module Rubillow
  # Interface for the Property Details API.
  # End Point:  http://www.zillow.com/webservice/ProReviews.htm
  # Read the more about this API at: {http://www.zillow.com/howto/api/ReviewsAPI.htm}
  class Reviews
    # Retrieve a Users reviews by ScreenName.
    #
    # Read more at: {http://www.zillow.com/howto/api/ReviewsAPI.htm}.
    # 
    # @example
    #   data = Rubillow::Reviews.search({ :screenname => 'admin442' })
    #   
    #   if data.success?
    #     puts data.zpid    # "48749425" 
    #     puts data.price   # "1032000"
    #   end
    #
    
    def self.search(options = {})
      options = {
        :zws_id => Rubillow.configuration.zwsid,
        :screenname => nil,
        :count => 10
      }.merge!(options)
      
      if options[:screenname].nil?
        raise ArgumentError, "The screenname option is required"
      end
      
      Models::SearchResult.new(Rubillow::Request.get("ProReviews", options))
    end
  end
end