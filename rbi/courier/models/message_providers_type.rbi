# typed: strong

module Courier
  module Models
    class MessageProvidersType < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::MessageProvidersType, Courier::Internal::AnyHash)
        end

      # JS conditional with access to data/profile.
      sig { returns(T.nilable(String)) }
      attr_accessor :if_

      sig { returns(T.nilable(Courier::Metadata)) }
      attr_reader :metadata

      sig { params(metadata: T.nilable(Courier::Metadata::OrHash)).void }
      attr_writer :metadata

      # Provider-specific overrides.
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_accessor :override

      sig { returns(T.nilable(Integer)) }
      attr_accessor :timeouts

      sig do
        params(
          if_: T.nilable(String),
          metadata: T.nilable(Courier::Metadata::OrHash),
          override: T.nilable(T::Hash[Symbol, T.anything]),
          timeouts: T.nilable(Integer)
        ).returns(T.attached_class)
      end
      def self.new(
        # JS conditional with access to data/profile.
        if_: nil,
        metadata: nil,
        # Provider-specific overrides.
        override: nil,
        timeouts: nil
      )
      end

      sig do
        override.returns(
          {
            if_: T.nilable(String),
            metadata: T.nilable(Courier::Metadata),
            override: T.nilable(T::Hash[Symbol, T.anything]),
            timeouts: T.nilable(Integer)
          }
        )
      end
      def to_hash
      end
    end
  end
end
