# typed: strong

module Trycourier
  module Resources
    class Automations
      sig { returns(Trycourier::Resources::Automations::Invoke) }
      attr_reader :invoke

      # Get the list of automations.
      sig do
        params(
          cursor: String,
          version: Trycourier::AutomationListParams::Version::OrSymbol,
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(Trycourier::AutomationTemplateListResponse)
      end
      def list(
        # A cursor token for pagination. Use the cursor from the previous response to
        # fetch the next page of results.
        cursor: nil,
        # The version of templates to retrieve. Accepted values are published (for
        # published templates) or draft (for draft templates). Defaults to published.
        version: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Trycourier::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
