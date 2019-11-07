module SimpleForm
  class BulmaFormBuilder < SimpleForm::FormBuilder

    def button(type, *args, &block)
      tag.p class: "control" do
        super
      end
    end

    private

    def tag
      ActionController::Base.helpers.tag
    end

  end
end
