# typed: strong

module Trycourier
  module Models
    class AudienceUpdateResponse < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Trycourier::Models::AudienceUpdateResponse,
            Trycourier::Internal::AnyHash
          )
        end

      sig { returns(Trycourier::Audience) }
      attr_reader :audience

      sig { params(audience: Trycourier::Audience::OrHash).void }
      attr_writer :audience

      sig do
        params(audience: Trycourier::Audience::OrHash).returns(T.attached_class)
      end
      def self.new(audience:)
      end

      sig { override.returns({ audience: Trycourier::Audience }) }
      def to_hash
      end
    end
  end
end
