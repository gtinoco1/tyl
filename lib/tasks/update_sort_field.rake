namespace :update do
  desc "Update sort filed in property to implement drag functionality in property list."

  task :update_property_sort_field => :environment  do
    Property.all.each do |prop|
       prop.update_attribute :sort, prop.id
    end
  end

  task :update_activity_sort_field => :environment  do
    Activity.all.each do |activity|
       activity.update_attribute :sort, activity.id
    end
  end
end
