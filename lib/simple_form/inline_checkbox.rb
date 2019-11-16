SimpleForm.setup do |config|
  # vertical input for boolean
  config.wrappers :inline_checkbox, tag: :div, class: "field" do |b|
    b.use :html5
    b.optional :readonly
    b.wrapper tag: :div, class: "control" do |bb|
      bb.wrapper tag: :label, class: "checkbox" do |bbb|
        bbb.use :label_text
        bbb.use :input, type: "checkbox"
      end
      bb.use :full_error, wrap_with: { tag: :p, class: "help is-danger" }
      bb.use :hint, wrap_with: { tag: :p, class: "help" }
    end
  end
end
