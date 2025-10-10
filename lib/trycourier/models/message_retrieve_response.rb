# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Messages#retrieve
    class MessageRetrieveResponse < Trycourier::Models::MessageDetails
      # @!attribute providers
      #
      #   @return [Array<Hash{Symbol=>Object}>, nil]
      optional :providers,
               Trycourier::Internal::Type::ArrayOf[Trycourier::Internal::Type::HashOf[Trycourier::Internal::Type::Unknown]],
               nil?: true

      # @!method initialize(providers: nil)
      #   @param providers [Array<Hash{Symbol=>Object}>, nil]
    end
  end
end
