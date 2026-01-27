# typed: strong

module Courier
  module Models
    class AudienceUpdateResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::Models::AudienceUpdateResponse,
            Courier::Internal::AnyHash
          )
        end

      sig { returns(Courier::Audience) }
      attr_reader :audience

      sig { params(audience: Courier::Audience::OrHash).void }
      attr_writer :audience

      sig do
        params(audience: Courier::Audience::OrHash).returns(T.attached_class)
      end
      def self.new(audience:)
      end

      sig { override.returns({ audience: Courier::Audience }) }
      def to_hash
      end
    end
  end
end
