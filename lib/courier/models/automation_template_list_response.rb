# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Automations#list
    class AutomationTemplateListResponse < Courier::Internal::Type::BaseModel
      # @!attribute cursor
      #   A cursor token for pagination. Present when there are more results available.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute templates
      #
      #   @return [Array<Courier::Models::AutomationTemplate>, nil]
      optional :templates, -> { Courier::Internal::Type::ArrayOf[Courier::AutomationTemplate] }

      # @!method initialize(cursor: nil, templates: nil)
      #   @param cursor [String] A cursor token for pagination. Present when there are more results available.
      #
      #   @param templates [Array<Courier::Models::AutomationTemplate>]
    end
  end
end
