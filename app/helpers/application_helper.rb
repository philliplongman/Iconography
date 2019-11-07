module ApplicationHelper

  def bulma_form_for(object, *args, **opts, &block)
    opts.merge! builder: SimpleForm::BulmaFormBuilder
    simple_form_for(object, *args, **opts, &block)
  end

  def cancel_button(text = "Cancel")
    tag.div class: "control" do
      link_to text, :back, class: %w[button cancel-button]
    end
  end

  def link_button(text, path)
    tag.div class: "control" do
      link_to text, path, class: %w[button link-button]
    end
  end

end
