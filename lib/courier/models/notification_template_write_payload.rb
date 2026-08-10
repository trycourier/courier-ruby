# frozen_string_literal: true

module Courier
  module Models
    class NotificationTemplateWritePayload < Courier::Models::NotificationTemplatePayload
      # @!attribute alias_
      #   Send-time alias for this template — the value you pass as `event` to POST /send.
      #   Writes accept a single alias only. Optional, with three distinct meanings. Omit
      #   it to leave any existing aliases untouched. Send a string to make this the
      #   template's only alias — a template that already resolved from several aliases
      #   keeps just this one and the rest are detached. Send null to remove every alias
      #   from the template. An alias may not be claimed by another template — doing so
      #   returns 409 — and may not begin with "tenant/".
      #
      #   @return [String, nil]
      optional :alias_, String, api_name: :alias, nil?: true

      # @!method initialize(alias_: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::NotificationTemplateWritePayload} for more details.
      #
      #   Template fields accepted in POST and PUT request bodies, nested under a
      #   `notification` key.
      #
      #   @param alias_ [String, nil] Send-time alias for this template — the value you pass as `event` to POST /send.
    end
  end
end
