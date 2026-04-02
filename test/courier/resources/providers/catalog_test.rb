# frozen_string_literal: true

require_relative "../../test_helper"

class Courier::Test::Resources::Providers::CatalogTest < Courier::Test::ResourceTest
  def test_list
    skip("Mock server tests are disabled")

    response = @courier.providers.catalog.list

    assert_pattern do
      response => Courier::Models::Providers::CatalogListResponse
    end

    assert_pattern do
      response => {
        paging: Courier::Paging,
        results: ^(Courier::Internal::Type::ArrayOf[Courier::ProvidersCatalogEntry])
      }
    end
  end
end
