# typed: strong

module Courier
  module Models
    class NotificationTemplateWritePayload < Courier::Models::NotificationTemplatePayload
      OrHash =
        T.type_alias do
          T.any(
            Courier::NotificationTemplateWritePayload,
            Courier::Internal::AnyHash
          )
        end

      # Send-time alias for this template — the value you pass as `event` to POST /send.
      # Writes accept a single alias only. Optional, with three distinct meanings. Omit
      # it to leave any existing aliases untouched. Send a string to make this the
      # template's only alias — a template that already resolved from several aliases
      # keeps just this one and the rest are detached. Send null to remove every alias
      # from the template. An alias may not be claimed by another template — doing so
      # returns 409 — and may not begin with "tenant/".
      sig { returns(T.nilable(String)) }
      attr_accessor :alias_

      # Template fields accepted in POST and PUT request bodies, nested under a
      # `notification` key.
      sig { params(alias_: T.nilable(String)).returns(T.attached_class) }
      def self.new(
        # Send-time alias for this template — the value you pass as `event` to POST /send.
        # Writes accept a single alias only. Optional, with three distinct meanings. Omit
        # it to leave any existing aliases untouched. Send a string to make this the
        # template's only alias — a template that already resolved from several aliases
        # keeps just this one and the rest are detached. Send null to remove every alias
        # from the template. An alias may not be claimed by another template — doing so
        # returns 409 — and may not begin with "tenant/".
        alias_: nil
      )
      end

      sig { override.returns({ alias_: T.nilable(String) }) }
      def to_hash
      end
    end
  end
end
