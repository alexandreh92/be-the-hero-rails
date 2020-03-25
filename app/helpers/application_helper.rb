# frozen_string_literal: true

module ApplicationHelper
  def plural(class_name)
    class_name.model_name.human(count: 'many')
  end

  def singular(class_name)
    class_name.model_name.human
  end

  def humanize_boolean(boolean)
    boolean ||= false
    I18n.t((!!boolean).to_s)
  end
end
