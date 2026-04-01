# frozen_string_literal: true

require_relative "../test_helper"

class Courier::Test::Resources::ProvidersTest < Courier::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @courier.providers.create(provider: "provider")

    assert_pattern do
      response => Courier::Provider
    end

    assert_pattern do
      response => {
        id: String,
        created: Integer,
        provider: String,
        settings: ^(Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]),
        title: String,
        alias_: String | nil,
        updated: Integer | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @courier.providers.retrieve("id")

    assert_pattern do
      response => Courier::Provider
    end

    assert_pattern do
      response => {
        id: String,
        created: Integer,
        provider: String,
        settings: ^(Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]),
        title: String,
        alias_: String | nil,
        updated: Integer | nil
      }
    end
  end

  def test_update_required_params
    skip("Mock server tests are disabled")

    response = @courier.providers.update("id", provider: "provider")

    assert_pattern do
      response => Courier::Provider
    end

    assert_pattern do
      response => {
        id: String,
        created: Integer,
        provider: String,
        settings: ^(Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]),
        title: String,
        alias_: String | nil,
        updated: Integer | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @courier.providers.list

    assert_pattern do
      response => Courier::Models::ProviderListResponse
    end

    assert_pattern do
      response => {
        paging: Courier::Paging,
        results: ^(Courier::Internal::Type::ArrayOf[Courier::Provider])
      }
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @courier.providers.delete("id")

    assert_pattern do
      response => nil
    end
  end
end
