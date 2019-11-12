SimpleForm.setup do |config|
  config.wrappers :bulma_vertical_form, tag: :div, class: "field" do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: "label"
    b.wrapper :control_wrapper, class: "control" do |bb|
      bb.use :input, class: "input", error_class: "is-danger"
      bb.use :icons
    end
    b.optional :full_error, wrap_with: { tag: :p, class: "help is-danger" }
    b.optional :hint, wrap_with: { tag: :p, class: "help" }
  end
end
