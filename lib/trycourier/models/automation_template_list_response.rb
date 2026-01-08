# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Automations#list
    class AutomationTemplateListResponse < Trycourier::Internal::Type::BaseModel
      # @!attribute cursor
      #   A cursor token for pagination. Present when there are more results available.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute templates
      #
      #   @return [Array<Trycourier::Models::AutomationTemplate>, nil]
      optional :templates, -> { Trycourier::Internal::Type::ArrayOf[Trycourier::AutomationTemplate] }

      # @!method initialize(cursor: nil, templates: nil)
      #   @param cursor [String] A cursor token for pagination. Present when there are more results available.
      #
      #   @param templates [Array<Trycourier::Models::AutomationTemplate>]
    end
  end
end
