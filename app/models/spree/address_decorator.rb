# frozen_string_literal: true

Spree::Address.class_eval do
  include ToAvataxHash

  def validation_enabled?
    Spree::Avatax::Config.address_validation && country_validation_enabled?
  end

  def country_validation_enabled?
    Spree::Address.validation_enabled_countries.include?(country.try(:name))
  end

  def self.validation_enabled_countries
    Spree::Avatax::Config.address_validation_enabled_countries
  end
end
