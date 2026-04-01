# typed: strong

module Courier
  module Models
    module Providers
      class CatalogListResponse < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::Models::Providers::CatalogListResponse,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(Courier::Paging) }
        attr_reader :paging

        sig { params(paging: Courier::Paging::OrHash).void }
        attr_writer :paging

        sig { returns(T::Array[Courier::ProvidersCatalogEntry]) }
        attr_accessor :results

        # Paginated list of available provider types with their configuration schemas.
        sig do
          params(
            paging: Courier::Paging::OrHash,
            results: T::Array[Courier::ProvidersCatalogEntry::OrHash]
          ).returns(T.attached_class)
        end
        def self.new(paging:, results:)
        end

        sig do
          override.returns(
            {
              paging: Courier::Paging,
              results: T::Array[Courier::ProvidersCatalogEntry]
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
