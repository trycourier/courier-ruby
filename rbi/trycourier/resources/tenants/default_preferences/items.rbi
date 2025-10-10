# typed: strong

module Trycourier
  module Resources
    class Tenants
      class DefaultPreferences
        class Items
          # Create or Replace Default Preferences For Topic
          sig do
            params(
              topic_id: String,
              tenant_id: String,
              status: Trycourier::SubscriptionTopicNew::Status::OrSymbol,
              custom_routing:
                T.nilable(
                  T::Array[Trycourier::ChannelClassification::OrSymbol]
                ),
              has_custom_routing: T.nilable(T::Boolean),
              request_options: Trycourier::RequestOptions::OrHash
            ).void
          end
          def update(
            # Path param: Id fo the susbcription topic you want to have a default preference
            # for.
            topic_id,
            # Path param: Id of the tenant to update the default preferences for.
            tenant_id:,
            # Body param:
            status:,
            # Body param: The default channels to send to this tenant when has_custom_routing
            # is enabled
            custom_routing: nil,
            # Body param: Override channel routing with custom preferences. This will override
            # any template prefernces that are set, but a user can still customize their
            # preferences
            has_custom_routing: nil,
            request_options: {}
          )
          end

          # Remove Default Preferences For Topic
          sig do
            params(
              topic_id: String,
              tenant_id: String,
              request_options: Trycourier::RequestOptions::OrHash
            ).void
          end
          def delete(
            # Id fo the susbcription topic you want to have a default preference for.
            topic_id,
            # Id of the tenant to update the default preferences for.
            tenant_id:,
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
  end
end
