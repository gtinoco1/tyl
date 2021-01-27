ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }


  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
          render partial: 'metrics/active_users_monthly'
      end
      column do
        render partial: 'metrics/total_users'
      end
    end

    columns do
      column do
          render partial: 'metrics/active_users_weekly'
      end
      column do
        render partial: 'metrics/no_of_activities_and_properties'
      end
    end

    columns do
      column do
        panel "Users" do
          test_order = if params[:order].present?
              order_param =  params[:order].gsub(/[^a-z_]/,'').gsub(/_(asc|desc)$/, ' \1')
                if ["first_name desc", "first_name asc", "email desc", "email asc"].include?(order_param)
                  params[:order].gsub(/[^a-z_]/,'').gsub(/_(asc|desc)$/, ' \1')
              end
            else
              "created_at desc"
            end

            paginated_collection(User.all.order(test_order).page(params[:users_page]).per(5), download_links: false, :param_name => 'users_page') do
              table_for User.all.order(test_order).page(params[:users_page]).per(5), sortable: true, class: 'index_table' do
                column :Name, :sortable => 'first_name' do |user|
                  link_to(user.first_name, admin_user_path(user))
                end
                column :email
                column "# of Activities", :activities_count
                column "# of Properties", :properties_count
                column "Date of Last Activity", :date_of_last_activity
              end
            end
        end
      end
      column do
        panel "Properties" do
          property_order = if params[:order].present?
            order_param =  params[:order].gsub(/[^a-z_]/,'').gsub(/_(asc|desc)$/, ' \1')
              if ["address desc", "address asc"].include?(order_param)
                params[:order].gsub(/[^a-z_]/,'').gsub(/_(asc|desc)$/, ' \1')
            end
          else
            "created_at desc"
          end
          paginated_collection(Property&.all&.order(property_order).page(params[:property_page]).per(5), download_links: false, :param_name => 'property_page') do
            table_for Property&.all&.order(property_order).page(params[:property_page]).per(5), sortable: true, class: 'index_table' do
              column :address, :sortable => 'address' do |property|
                link_to(property.address, admin_property_path(property))
              end
              column "# of Activities", :activities_count
              column "User", :property_user
              column "Date of Last Activity", :date_of_last_activity
            end
          end
        end
      end
    end
  end
end
