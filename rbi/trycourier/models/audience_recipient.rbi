# typed: strong

module Trycourier
  module Models
    class AudienceRecipient < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::AudienceRecipient, Trycourier::Internal::AnyHash)
        end

      # A unique identifier associated with an Audience. A message will be sent to each
      # user in the audience.
      sig { returns(String) }
      attr_accessor :audience_id

      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_accessor :data

      sig { returns(T.nilable(T::Array[Trycourier::AudienceFilter])) }
      attr_accessor :filters

      # Send to all users in an audience
      sig do
        params(
          audience_id: String,
          data: T.nilable(T::Hash[Symbol, T.anything]),
          filters: T.nilable(T::Array[Trycourier::AudienceFilter::OrHash])
        ).returns(T.attached_class)
      end
      def self.new(
        # A unique identifier associated with an Audience. A message will be sent to each
        # user in the audience.
        audience_id:,
        data: nil,
        filters: nil
      )
      end

      sig do
        override.returns(
          {
            audience_id: String,
            data: T.nilable(T::Hash[Symbol, T.anything]),
            filters: T.nilable(T::Array[Trycourier::AudienceFilter])
          }
        )
      end
      def to_hash
      end
    end
  end
end
