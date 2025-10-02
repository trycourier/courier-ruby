# typed: strong

module Courier
  module Models
    # Syntatic Sugar to provide a fast shorthand for Courier Elemental Blocks.
    module Content
      extend Courier::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Courier::Tenants::ElementalContent,
            Courier::Content::ElementalContentSugar
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

        # The title to be displayed by supported channels i.e. push, email (as subject)
        sig { returns(String) }
        attr_accessor :title

        # Syntatic Sugar to provide a fast shorthand for Courier Elemental Blocks.
        sig { params(body: String, title: String).returns(T.attached_class) }
        def self.new(
          # The text content displayed in the notification.
          body:,
          # The title to be displayed by supported channels i.e. push, email (as subject)
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
