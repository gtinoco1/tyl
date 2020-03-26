namespace :update do
  desc "Update sort filed in property to implement drag functionality in property list."

  task :update_property_sort_field => :environment  do
    Property.all.each do |prop|
       prop.update_attribute :sort, prop.id
    end
  end
end
