# frozen_string_literal: true

module Courier
  module Models
    # A template's send-time alias as returned by a read, omitted entirely when it has
    # none. Usually a single string; an array for a template that resolves from
    # several aliases, which writes through this API can no longer produce — only
    # templates predating that restriction, or aliases attached outside this API, hold
    # more than one.
    module NotificationTemplateAlias
      extend Courier::Internal::Type::Union

      variant String

      variant -> { Courier::Models::NotificationTemplateAlias::StringArray }

      # @!method self.variants
      #   @return [Array(String, Array<String>)]

      # @type [Courier::Internal::Type::Converter]
      StringArray = Courier::Internal::Type::ArrayOf[String]
    end
  end
end
