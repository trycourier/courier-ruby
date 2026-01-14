# typed: strong

module Trycourier
  module Models
    class AudienceFilterConfig < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::AudienceFilterConfig, Trycourier::Internal::AnyHash)
        end

      # Array of filter rules (single conditions or nested groups)
      sig { returns(T::Array[Trycourier::FilterConfig]) }
      attr_accessor :filters

      # Filter configuration for audience membership containing an array of filter rules
      sig do
        params(filters: T::Array[Trycourier::FilterConfig::OrHash]).returns(
          T.attached_class
        )
      end
      def self.new(
        # Array of filter rules (single conditions or nested groups)
        filters:
      )
      end

      sig { override.returns({ filters: T::Array[Trycourier::FilterConfig] }) }
      def to_hash
      end
    end
  end
end
