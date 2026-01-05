# typed: strong

module Trycourier
  module Models
    # A single filter to use for filtering
    module FilterConfig
      extend Trycourier::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(Trycourier::SingleFilterConfig, Trycourier::NestedFilterConfig)
        end

      sig { override.returns(T::Array[Trycourier::FilterConfig::Variants]) }
      def self.variants
      end
    end
  end
end
