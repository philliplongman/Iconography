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
    b.use :input,
      class:        "input",
      wrap_with:    { tag: "div", class: "control" },
      error_class:  "is-danger",
      valid_class:  "is-success"
    b.use :full_error, wrap_with: { tag: :p, class: "help is-danger" }
    b.use :hint, wrap_with: { tag: :p, class: "help" }
  end
end
