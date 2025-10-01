# typed: strong

module Courier
  module Models
    # Describes the content of the message in a way that will work for email, push,
    # chat, or any channel.
    module Message
      extend Courier::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Courier::Message::ContentMessage,
            Courier::Message::TemplateMessage
          )
        end

      sig { override.returns(T::Array[Courier::Message::Variants]) }
      def self.variants
      end
    end
  end
end
