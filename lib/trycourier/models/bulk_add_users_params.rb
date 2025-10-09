# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Bulk#add_users
    class BulkAddUsersParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      # @!attribute users
      #
      #   @return [Array<Trycourier::Models::InboundBulkMessageUser>]
      required :users, -> { Trycourier::Internal::Type::ArrayOf[Trycourier::InboundBulkMessageUser] }

      # @!method initialize(users:, request_options: {})
      #   @param users [Array<Trycourier::Models::InboundBulkMessageUser>]
      #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
