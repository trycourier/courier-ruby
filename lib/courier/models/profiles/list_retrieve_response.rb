# frozen_string_literal: true

module Courier
  module Models
    module Profiles
      # @see Courier::Resources::Profiles::Lists#retrieve
      class ListRetrieveResponse < Courier::Internal::Type::BaseModel
        # @!attribute paging
        #
        #   @return [Courier::Models::Paging]
        required :paging, -> { Courier::Paging }

        # @!attribute results
        #   An array of lists
        #
        #   @return [Array<Courier::Models::Profiles::ListRetrieveResponse::Result>]
        required :results,
                 -> { Courier::Internal::Type::ArrayOf[Courier::Models::Profiles::ListRetrieveResponse::Result] }

        # @!method initialize(paging:, results:)
        #   @param paging [Courier::Models::Paging]
        #
        #   @param results [Array<Courier::Models::Profiles::ListRetrieveResponse::Result>] An array of lists

        class Result < Courier::Internal::Type::BaseModel
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
          #   @return [Courier::Models::Lists::RecipientPreferences, nil]
          optional :preferences, -> { Courier::Lists::RecipientPreferences }, nil?: true

          # @!method initialize(id:, created:, name:, updated:, preferences: nil)
          #   Some parameter documentations has been truncated, see
          #   {Courier::Models::Profiles::ListRetrieveResponse::Result} for more details.
          #
          #   @param id [String]
          #
          #   @param created [String] The date/time of when the list was created. Represented as a string in ISO forma
          #
          #   @param name [String] List name
          #
          #   @param updated [String] The date/time of when the list was updated. Represented as a string in ISO forma
          #
          #   @param preferences [Courier::Models::Lists::RecipientPreferences, nil]
        end
      end
    end
  end
end
