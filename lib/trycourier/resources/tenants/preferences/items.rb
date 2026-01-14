# frozen_string_literal: true

module Trycourier
  module Resources
    class Tenants
      class Preferences
        class Items
          # Some parameter documentations has been truncated, see
          # {Trycourier::Models::Tenants::Preferences::ItemUpdateParams} for more details.
          #
          # Create or Replace Default Preferences For Topic
          #
          # @overload update(topic_id, tenant_id:, status:, custom_routing: nil, has_custom_routing: nil, request_options: {})
          #
          # @param topic_id [String] Path param: Id of the subscription topic you want to have a default preference f
          #
          # @param tenant_id [String] Path param: Id of the tenant to update the default preferences for.
          #
          # @param status [Symbol, Trycourier::Models::SubscriptionTopicNew::Status] Body param
          #
          # @param custom_routing [Array<Symbol, Trycourier::Models::ChannelClassification>, nil] Body param: The default channels to send to this tenant when has_custom_routing
          #
          # @param has_custom_routing [Boolean, nil] Body param: Override channel routing with custom preferences. This will override
          #
          # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [nil]
          #
          # @see Trycourier::Models::Tenants::Preferences::ItemUpdateParams
          def update(topic_id, params)
            parsed, options = Trycourier::Tenants::Preferences::ItemUpdateParams.dump_request(params)
            tenant_id =
              parsed.delete(:tenant_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              method: :put,
              path: ["tenants/%1$s/default_preferences/items/%2$s", tenant_id, topic_id],
              body: parsed,
              model: NilClass,
              options: options
            )
          end

          # Remove Default Preferences For Topic
          #
          # @overload delete(topic_id, tenant_id:, request_options: {})
          #
          # @param topic_id [String] Id of the subscription topic you want to have a default preference for.
          #
          # @param tenant_id [String] Id of the tenant to update the default preferences for.
          #
          # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [nil]
          #
          # @see Trycourier::Models::Tenants::Preferences::ItemDeleteParams
          def delete(topic_id, params)
            parsed, options = Trycourier::Tenants::Preferences::ItemDeleteParams.dump_request(params)
            tenant_id =
              parsed.delete(:tenant_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              method: :delete,
              path: ["tenants/%1$s/default_preferences/items/%2$s", tenant_id, topic_id],
              model: NilClass,
              options: options
            )
          end

          # @api private
          #
          # @param client [Trycourier::Client]
          def initialize(client:)
            @client = client
          end
        end
      end
    end
  end
end
