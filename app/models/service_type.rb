class ServiceType < ApplicationRecord
  def self.human_name(key_value)
    I18n.t("#{model_name.i18n_key}.name.#{key_value}")
  end

  def name
    ServiceType.human_name(name_key)
  end
end
