# typed: strong

module Courier
  module Models
    class AudienceListMembersParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Courier::AudienceListMembersParams, Courier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :audience_id

      # A unique identifier that allows for fetching the next set of members
      sig { returns(T.nilable(String)) }
      attr_accessor :cursor

      sig do
        params(
          audience_id: String,
          cursor: T.nilable(String),
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        audience_id:,
        # A unique identifier that allows for fetching the next set of members
        cursor: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            audience_id: String,
            cursor: T.nilable(String),
            request_options: Courier::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
