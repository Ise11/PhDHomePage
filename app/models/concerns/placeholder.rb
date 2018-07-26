module Placeholder
    extend ActiveSupport::Concern

    def self.image_generator(height:, width:)
        "http://placekitten.com/#{height}/#{width}"
    end
end