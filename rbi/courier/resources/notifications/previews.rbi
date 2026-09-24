# typed: strong

module Courier
  module Resources
    class Notifications
      class Previews
        # Render a template's email content on real email clients and read back the
        # screenshots, so you can check how it looks before you send it.
        sig { returns(Courier::Resources::Notifications::Previews::Runs) }
        attr_reader :runs

        # @api private
        sig { params(client: Courier::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
