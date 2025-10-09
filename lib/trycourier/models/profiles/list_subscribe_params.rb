# frozen_string_literal: true

module Trycourier
  module Models
    module Profiles
      # @see Trycourier::Resources::Profiles::Lists#subscribe
      class ListSubscribeParams < Trycourier::Internal::Type::BaseModel
        extend Trycourier::Internal::Type::RequestParameters::Converter
        include Trycourier::Internal::Type::RequestParameters

        # @!attribute lists
        #
        #   @return [Array<Trycourier::Models::Profiles::ListSubscribeParams::List>]
        required :lists,
                 -> { Trycourier::Internal::Type::ArrayOf[Trycourier::Profiles::ListSubscribeParams::List] }

        # @!method initialize(lists:, request_options: {})
        #   @param lists [Array<Trycourier::Models::Profiles::ListSubscribeParams::List>]
        #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]

        class List < Trycourier::Internal::Type::BaseModel
          # @!attribute list_id
          #
          #   @return [String]
          required :list_id, String, api_name: :listId

          # @!attribute preferences
          #
          #   @return [Trycourier::Models::RecipientPreferences, nil]
          optional :preferences, -> { Trycourier::RecipientPreferences }, nil?: true

          # @!method initialize(list_id:, preferences: nil)
          #   @param list_id [String]
          #   @param preferences [Trycourier::Models::RecipientPreferences, nil]
        end
      end
    end
  end
end
