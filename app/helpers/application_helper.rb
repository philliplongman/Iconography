module ApplicationHelper

  def bulma_form_for(object, **opts, &block)
    opts.merge! builder: SimpleForm::BulmaFormBuilder
    simple_form_for(object, **opts, &block)
  end

  def cancel_button(text = "Cancel", **actions)
    paths = HashWithIndifferentAccess.new(:back).merge(actions)

    tag.div class: "control" do
      link_to text, paths[controller.action_name], class: %w[button cancel-button]
    end
  end

  def delete_button(model, text: nil)
    opts = {
      method: :delete,
      class: "button is-danger is-outlined",
      data: { confirm: "Are you sure?" }
    }

    button_to model, opts do
      text || "Delete #{Array(model).last.model_name}".titleize
    end
  end

  def link_button(text, path)
    tag.div class: "control" do
      link_to text, path, class: %w[button link-button]
    end
  end

end
