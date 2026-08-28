# typed: strong

module Courier
  module Models
    class ElementalMetaNode < Courier::Models::ElementalBaseNode
      OrHash =
        T.type_alias do
          T.any(Courier::ElementalMetaNode, Courier::Internal::AnyHash)
        end

      # The title to be displayed by supported channels. For example, the email subject.
      sig { returns(T.nilable(String)) }
      attr_accessor :title

      # The meta element contains information describing the notification that may be
      # used by a particular channel or provider. One important field is the title field
      # which will be used as the title for channels that support it.
      sig { params(title: T.nilable(String)).returns(T.attached_class) }
      def self.new(
        # The title to be displayed by supported channels. For example, the email subject.
        title: nil
      )
      end

      sig { override.returns({ title: T.nilable(String) }) }
      def to_hash
      end
    end
  end
end
