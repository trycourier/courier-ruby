# typed: strong

module Courier
  module Models
    class AudienceFilterConfig < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::AudienceFilterConfig, Courier::Internal::AnyHash)
        end

      # Array of filter rules (single conditions or nested groups)
      sig { returns(T::Array[Courier::FilterConfig]) }
      attr_accessor :filters

      # Filter configuration for audience membership containing an array of filter rules
      sig do
        params(filters: T::Array[Courier::FilterConfig::OrHash]).returns(
          T.attached_class
        )
      end
      def self.new(
        # Array of filter rules (single conditions or nested groups)
        filters:
      )
      end

      sig { override.returns({ filters: T::Array[Courier::FilterConfig] }) }
      def to_hash
      end
    end
  end
end
