# frozen_string_literal: true

module Courier
  module Models
    # Template state. Defaults to `DRAFT`.
    module NotificationTemplateState
      extend Courier::Internal::Type::Enum

      DRAFT = :DRAFT
      PUBLISHED = :PUBLISHED

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
