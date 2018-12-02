module ApplicationHelper
  def meta_tags_defaults
    { site: t('brand.name'),
      description: "",
      keywords: "" }
  end

  def service_types_collection
    ServiceType.all.map do |st|
      [ServiceType.human_name(st.name_key), st.id]
    end
  end
end
