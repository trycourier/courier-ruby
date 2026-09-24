# typed: strong

module Courier
  module Models
    module Notifications
      PreviewResultFailureReason = Previews::PreviewResultFailureReason

      module Previews
        # Why one device's render failed, when its `status` is `FAILED` and the cause has
        # a public name. `DELIVERY_FAILED` means the rendering service could not deliver
        # the message to its own capture mailbox — infrastructure, not anything wrong with
        # the template.
        module PreviewResultFailureReason
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Courier::Notifications::Previews::PreviewResultFailureReason
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DELIVERY_FAILED =
            T.let(
              :DELIVERY_FAILED,
              Courier::Notifications::Previews::PreviewResultFailureReason::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Courier::Notifications::Previews::PreviewResultFailureReason::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
