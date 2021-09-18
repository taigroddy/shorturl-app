module Users
  module LinkManagementsHelper
    def generate_actions(resource)
      element = <<-HTML
      <div class="actions">
        <a href="#{edit_link_path(resource)}"><i class="fa fa-pencil"></i></a>
        <a href="#{link_path(resource)}" data-method="delete"><i class="fa fa-trash"></i></a>
      </div>
      HTML

      element.html_safe
    end
  end
end
