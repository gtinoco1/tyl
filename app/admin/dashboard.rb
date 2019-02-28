ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Users" do
          ul do
            User.all.map do |user|
              li link_to(user.first_name, admin_user_path(user))
            end
           para "Total Users: #{User.all.count}"
          end
        end
      end

      column do
        panel "Info" do
          para "Welcome to ActiveAdmin."
        end
      end
    end
  end # content
end
