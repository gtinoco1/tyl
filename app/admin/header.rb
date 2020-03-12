module ActiveAdmin
  module Views
    class Header < Component

      def build(namespace, menu)
        super(id: "header")

        @namespace = namespace
        @menu = menu
        @utility_menu = @namespace.fetch_menu(:utility_navigation)

        site_title @namespace
        global_navigation @menu, class: 'header-item tabs'
        utility_navigation @utility_menu, id: "utility_nav", class: 'header-item tabs'


        div :id => "loader-div", :class => "loader" do
          image_tag "/assets/loader/loading.gif"
        end
      end

    end
  end
end
