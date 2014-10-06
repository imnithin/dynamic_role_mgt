namespace :workflow do

  desc "Add/Update data to permission class and permission methods table"
  task :dynamic_role_management => :environment do
    puts "Task started..."
    Rails.application.eager_load!
    app_classes = []
    ApplicationController.descendants.each do |c|
      controller_name = c.to_s.gsub("Controller", "")
      app_classes << controller_name
      actions = c.action_methods.to_a.delete_if {|a| a[0] == "_" || controller_name.include?('Devise') || controller_name.include?('Sessions') || controller_name.include?('Registrations')}
      unless actions.empty?
        controller = if PermissionClass.exists?(name: controller_name)
          PermissionClass.find_by_name(controller_name)
        else
          PermissionClass.create(name: controller_name)
        end
        controller.permission_methods.each do |p|
          if actions.include?(p.name)
          else
           p.destroy
         end
       end
       unless actions.empty?
        actions.each do |action|
          PermissionMethod.find_or_create_by_name_and_permission_class_id(name: action, permission_class_id: controller.id)
        end
      end
    end
    
  end
  classes = PermissionClass.all.map(&:name) - app_classes.delete_if{|a| a.include?("Devise")}
    PermissionClass.destroy_all(name: classes)
  puts "Done.."
end

end