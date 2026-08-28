# frozen_string_literal: true

module Courier
  module Models
    class ElementalMetaNode < Courier::Models::ElementalBaseNode
      # @!attribute title
      #   The title to be displayed by supported channels. For example, the email subject.
      #
      #   @return [String, nil]
      optional :title, String, nil?: true

      # @!method initialize(title: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::ElementalMetaNode} for more details.
      #
      #   The meta element contains information describing the notification that may be
      #   used by a particular channel or provider. One important field is the title field
      #   which will be used as the title for channels that support it.
      #
      #   @param title [String, nil] The title to be displayed by supported channels. For example, the email subject.
    end
  end
end
