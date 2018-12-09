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

  def active_if?(conditions)
    active_conditions = {
      action: action_name == conditions[:action],
      category: params[:category].to_s == conditions[:category],
      controller: controller_name == conditions[:controller],
      fullpath: request.fullpath =~ conditions[:fullpath],
      starts_with: fullpath_starts_with?(conditions[:starts_with].to_s)
    }.select{ |k,_| conditions.keys.include? k }.values
    return 'active' if active_conditions.all?
  end

  def fullpath_starts_with?(path)
    request.fullpath =~ /^\/#{Regexp.quote(path)}/
  end
end
