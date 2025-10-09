# frozen_string_literal: true

module Trycourier
  module Models
    module Profiles
      # @see Trycourier::Resources::Profiles::Lists#retrieve
      class ListRetrieveResponse < Trycourier::Internal::Type::BaseModel
        # @!attribute paging
        #
        #   @return [Trycourier::Models::Paging]
        required :paging, -> { Trycourier::Paging }

        # @!attribute results
        #   An array of lists
        #
        #   @return [Array<Trycourier::Models::Profiles::ListRetrieveResponse::Result>]
        required :results,
                 -> { Trycourier::Internal::Type::ArrayOf[Trycourier::Models::Profiles::ListRetrieveResponse::Result] }

        # @!method initialize(paging:, results:)
        #   @param paging [Trycourier::Models::Paging]
        #
        #   @param results [Array<Trycourier::Models::Profiles::ListRetrieveResponse::Result>] An array of lists

        class Result < Trycourier::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute created
          #   The date/time of when the list was created. Represented as a string in ISO
          #   format.
          #
          #   @return [String]
          required :created, String

          # @!attribute name
          #   List name
          #
          #   @return [String]
          required :name, String

          # @!attribute updated
          #   The date/time of when the list was updated. Represented as a string in ISO
          #   format.
          #
          #   @return [String]
          required :updated, String

          # @!attribute preferences
          #
          #   @return [Trycourier::Models::RecipientPreferences, nil]
          optional :preferences, -> { Trycourier::RecipientPreferences }, nil?: true

          # @!method initialize(id:, created:, name:, updated:, preferences: nil)
          #   Some parameter documentations has been truncated, see
          #   {Trycourier::Models::Profiles::ListRetrieveResponse::Result} for more details.
          #
          #   @param id [String]
          #
          #   @param created [String] The date/time of when the list was created. Represented as a string in ISO forma
          #
          #   @param name [String] List name
          #
          #   @param updated [String] The date/time of when the list was updated. Represented as a string in ISO forma
          #
          #   @param preferences [Trycourier::Models::RecipientPreferences, nil]
        end
      end
    end
  end
end
