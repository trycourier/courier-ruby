# frozen_string_literal: true

require_relative "../test_helper"

class Courier::Test::Resources::BrandsTest < Courier::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response = @courier.brands.create(name: "name")

    assert_pattern do
      response => Courier::Brand
    end

    assert_pattern do
      response => {
        id: String,
        created: Integer,
        name: String,
        updated: Integer,
        published: Integer | nil,
        settings: Courier::BrandSettings | nil,
        snippets: Courier::BrandSnippets | nil,
        version: String | nil
      }
    end
  end

  def test_retrieve
    skip("Prism tests are disabled")

    response = @courier.brands.retrieve("brand_id")

    assert_pattern do
      response => Courier::Brand
    end

    assert_pattern do
      response => {
        id: String,
        created: Integer,
        name: String,
        updated: Integer,
        published: Integer | nil,
        settings: Courier::BrandSettings | nil,
        snippets: Courier::BrandSnippets | nil,
        version: String | nil
      }
    end
  end

  def test_update_required_params
    skip("Prism tests are disabled")

    response = @courier.brands.update("brand_id", name: "name")

    assert_pattern do
      response => Courier::Brand
    end

    assert_pattern do
      response => {
        id: String,
        created: Integer,
        name: String,
        updated: Integer,
        published: Integer | nil,
        settings: Courier::BrandSettings | nil,
        snippets: Courier::BrandSnippets | nil,
        version: String | nil
      }
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @courier.brands.list

    assert_pattern do
      response => Courier::Models::BrandListResponse
    end

    assert_pattern do
      response => {
        paging: Courier::Paging,
        results: ^(Courier::Internal::Type::ArrayOf[Courier::Brand])
      }
    end
  end

  def test_delete
    skip("Prism tests are disabled")

    response = @courier.brands.delete("brand_id")

    assert_pattern do
      response => nil
    end
  end
end
