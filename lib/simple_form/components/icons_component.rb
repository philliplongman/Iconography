module IconsComponent

  # To avoid deprecation warning, you need to make the wrapper_options explicit
  # even when they won't be used.
  def icons(wrapper_options = nil)
    [left_icon, right_icon].join
  end

  private

  def left_icon(wrapper_options = nil)
    return nil unless icon_classes_left

    template.tag.span class: "icon is-small is-left" do
      template.icon(*icon_classes_left.split)
    end
  end

  def right_icon(wrapper_options = nil)
    return nil unless icon_classes_right

    template.tag.span class: "icon is-small is-right" do
      template.icon(*icon_classes_right.split)
    end
  end

  def icon_classes_left
    @icon_classes_left ||= options.dig(:icons, :left)
  end

  def icon_classes_right
    @icon_classes_right ||= options.dig(:icons, :right)
  end

end

SimpleForm.include_component(IconsComponent)
