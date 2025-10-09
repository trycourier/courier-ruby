# typed: strong

module Trycourier
  module Models
    class AudienceUpdateParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Trycourier::AudienceUpdateParams, Trycourier::Internal::AnyHash)
        end

      # A description of the audience
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # A single filter to use for filtering
      sig { returns(T.nilable(Trycourier::Filter)) }
      attr_reader :filter

      sig { params(filter: T.nilable(Trycourier::Filter::OrHash)).void }
      attr_writer :filter

      # The name of the audience
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      sig do
        params(
          description: T.nilable(String),
          filter: T.nilable(Trycourier::Filter::OrHash),
          name: T.nilable(String),
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # A description of the audience
        description: nil,
        # A single filter to use for filtering
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
            filter: T.nilable(Trycourier::Filter),
            name: T.nilable(String),
            request_options: Trycourier::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
