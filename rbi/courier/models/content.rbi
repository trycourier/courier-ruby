# typed: strong

module Courier
  module Models
    # Syntactic sugar to provide a fast shorthand for Courier Elemental Blocks.
    module Content
      extend Courier::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Courier::Content::ElementalContentSugar,
            Courier::Tenants::ElementalContent
          )
        end

      class ElementalContentSugar < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::Content::ElementalContentSugar,
              Courier::Internal::AnyHash
            )
          end

        # The text content displayed in the notification.
        sig { returns(String) }
        attr_accessor :body

        # Title/subject displayed by supported channels.
        sig { returns(String) }
        attr_accessor :title

        # Syntactic sugar to provide a fast shorthand for Courier Elemental Blocks.
        sig { params(body: String, title: String).returns(T.attached_class) }
        def self.new(
          # The text content displayed in the notification.
          body:,
          # Title/subject displayed by supported channels.
          title:
        )
        end

        sig { override.returns({ body: String, title: String }) }
        def to_hash
        end
      end

      sig { override.returns(T::Array[Courier::Content::Variants]) }
      def self.variants
      end
    end
  end
end
