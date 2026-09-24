# typed: strong

module Courier
  module Models
    module Notifications
      PreviewRunListResponse = Previews::PreviewRunListResponse

      module Previews
        class PreviewRunListResponse < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::Notifications::Previews::PreviewRunListResponse,
                Courier::Internal::AnyHash
              )
            end

          sig { returns(Courier::Paging) }
          attr_reader :paging

          sig { params(paging: Courier::Paging::OrHash).void }
          attr_writer :paging

          sig do
            returns(T::Array[Courier::Notifications::Previews::PreviewRun])
          end
          attr_accessor :results

          # Paginated list of preview runs, newest first.
          sig do
            params(
              paging: Courier::Paging::OrHash,
              results:
                T::Array[Courier::Notifications::Previews::PreviewRun::OrHash]
            ).returns(T.attached_class)
          end
          def self.new(paging:, results:)
          end

          sig do
            override.returns(
              {
                paging: Courier::Paging,
                results: T::Array[Courier::Notifications::Previews::PreviewRun]
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
