# frozen_string_literal: true

module Courier
  module Models
    module Profiles
      # @see Courier::Resources::Profiles::Lists#subscribe
      class ListSubscribeParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        # @!attribute lists
        #
        #   @return [Array<Courier::Models::Profiles::ListSubscribeParams::List>]
        required :lists, -> { Courier::Internal::Type::ArrayOf[Courier::Profiles::ListSubscribeParams::List] }

        # @!method initialize(lists:, request_options: {})
        #   @param lists [Array<Courier::Models::Profiles::ListSubscribeParams::List>]
        #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]

        class List < Courier::Internal::Type::BaseModel
          # @!attribute list_id
          #
          #   @return [String]
          required :list_id, String, api_name: :listId

          # @!attribute preferences
          #
          #   @return [Courier::Models::RecipientPreferences, nil]
          optional :preferences, -> { Courier::RecipientPreferences }, nil?: true

          # @!method initialize(list_id:, preferences: nil)
          #   @param list_id [String]
          #   @param preferences [Courier::Models::RecipientPreferences, nil]
        end
      end
    end
  end
end
