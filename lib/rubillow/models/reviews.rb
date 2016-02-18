module Rubillow
  module Models
    # List of postings 
    class Reviews < Base
      
      # @return [String] region id.
      attr_accessor :reviews
      
      # @return [Array] postings with MakeMeMove status ({Models::Posting}).
      attr_accessor :photo
      
      # @return [Array] postings with FSBA status ({Models::Posting}).
      attr_accessor :reviews_url
      
      # @return [Array] postings with FSBO status ({Models::Posting}).
      attr_accessor :review_link_text
      
      # @return [Array] postings with reporting status ({Models::Posting}).
      attr_accessor :position
      
      # @return [Array] postings with for rent status ({Models::Posting}).
      attr_accessor :company
      
      attr_accessor :specialties
      
      attr_accessor :service_areas
      
      attr_accessor :local_knowledge_rating, :process_expertise_rating, :responsiveness_rating, :negotiation_skill_rating
      
      protected
      
      # @private
      def parse
        super
        
        return if !success?
        
        @reviews = @parser.xpath('//review')
        binding.pry
      end
    end
  end
end