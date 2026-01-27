# typed: strong

module Courier
  module Resources
    class Automations
      sig { returns(Courier::Resources::Automations::Invoke) }
      attr_reader :invoke

      # Get the list of automations.
      sig do
        params(
          cursor: String,
          version: Courier::AutomationListParams::Version::OrSymbol,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::AutomationTemplateListResponse)
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
      sig { params(client: Courier::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
