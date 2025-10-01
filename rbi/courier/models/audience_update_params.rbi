# typed: strong

module Courier
  module Models
    class AudienceUpdateParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Courier::AudienceUpdateParams, Courier::Internal::AnyHash)
        end

      # A description of the audience
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # The operator to use for filtering
      sig do
        returns(
          T.nilable(
            T.any(Courier::Filter::UnionMember0, Courier::NestedFilterConfig)
          )
        )
      end
      attr_accessor :filter

      # The name of the audience
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      sig do
        params(
          description: T.nilable(String),
          filter:
            T.nilable(
              T.any(
                Courier::Filter::UnionMember0::OrHash,
                Courier::NestedFilterConfig::OrHash
              )
            ),
          name: T.nilable(String),
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # A description of the audience
        description: nil,
        # The operator to use for filtering
        filter: nil,
        # The name of the audience
        name: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            description: T.nilable(String),
            filter:
              T.nilable(
                T.any(
                  Courier::Filter::UnionMember0,
                  Courier::NestedFilterConfig
                )
              ),
            name: T.nilable(String),
            request_options: Courier::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
