# frozen_string_literal: true

require_relative "../test_helper"

class Courier::Test::Resources::TranslationsTest < Courier::Test::ResourceTest
  def test_retrieve_required_params
    skip("Prism tests are disabled")

    response = @courier.translations.retrieve("locale", domain: "domain")

    assert_pattern do
      response => String
    end
  end

  def test_update_required_params
    skip("Prism tests are disabled")

    response = @courier.translations.update("locale", domain: "domain", body: "body")

    assert_pattern do
      response => nil
    end
  end
end
