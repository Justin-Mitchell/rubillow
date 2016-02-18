module Rubillow
  module Models
    # List of postings 
    class Reviews < Base
      
      # @return [String] region id.
      attr_accessor :region_id
      
      # @return [Array] postings with MakeMeMove status ({Models::Posting}).
      attr_accessor :make_me_move
      
      # @return [Array] postings with FSBA status ({Models::Posting}).
      attr_accessor :for_sale_by_owner
      
      # @return [Array] postings with FSBO status ({Models::Posting}).
      attr_accessor :for_sale_by_agent
      
      # @return [Array] postings with reporting status ({Models::Posting}).
      attr_accessor :report_for_sale
      
      # @return [Array] postings with for rent status ({Models::Posting}).
      attr_accessor :for_rent
      
      protected
      
      # @private
      def parse
        super
        
        return if !success?
        binding.pry
      end
    end
  end
end