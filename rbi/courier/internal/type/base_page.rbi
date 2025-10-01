# typed: strong

module Courier
  module Internal
    module Type
      # @api private
      #
      # This module provides a base implementation for paginated responses in the SDK.
      module BasePage
        Elem = type_member(:out)

        sig { overridable.returns(T::Boolean) }
        def next_page?
        end

        sig { overridable.returns(T.self_type) }
        def next_page
        end

        sig { overridable.params(blk: T.proc.params(arg0: Elem).void).void }
        def auto_paging_each(&blk)
        end

        sig { returns(T::Enumerable[Elem]) }
        def to_enum
        end

        # @api private
        sig do
          params(
            client: Courier::Internal::Transport::BaseClient,
            req: Courier::Internal::Transport::BaseClient::RequestComponents,
            headers: T::Hash[String, String],
            page_data: T.anything
          ).void
        end
        def initialize(client:, req:, headers:, page_data:)
        end
      end
    end
  end
end
