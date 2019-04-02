ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    columns do
      column do
        form title: 'Set Precinct ID' do |f|
          input :precinct_id
          f.actions
        end
      end
    end

  end

end