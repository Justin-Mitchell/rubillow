module Rubillow
  module Models
    # List of postings 
    class Reviews < Base
      
      # @return [String] region id.
      attr_accessor :reviews
      
      protected
      
      # @private
      def parse
        super
      
        @reviews = data
      end
      
      def data
        return if !success?
        
        reviews = []
        response = @parser.xpath('//review')
        response.each_with_index do |data, i|
          review = {
            index: i,
            created_at: data.xpath("//reviewDate")[i].text,
            reviewer: data.xpath("//reviewer")[i].text,
            reviewer_link: data.xpath("//reviewerLink")[i].text,
            summary: data.xpath("//reviewSummary")[i].text,
            review: data.xpath("//description")[i].text,
            url: data.xpath("//reviewURL")[i].text,
            response: data.xpath("//reviewResponse")[i].text,
            ratings: {
              general: data.xpath("//rating")[i].text,
              local_knowledge: data.xpath("//localknowledgeRating")[i].text,
              process_expertise: data.xpath("//processexpertiseRating")[i].text,
              responsiveness: data.xpath("//responsivenessRating")[i].text,
              negotiation_skills: data.xpath("//negotiationskillsRating")[i].text,
            }
          }
          
          data << review
        end
        reviews
        
      end
    end
  end
end