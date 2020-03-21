ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    columns do
      column do
        panel 'New users' do
          ul do
            User.order(created_at: :desc).first(5).map do |user|
              li link_to(user.email, admin_user_path(user))
            end
          end
        end
      end

      column do
        panel 'Recent comments' do
          ul do
            Comment.order(created_at: :desc).first(5).map do |comment|
              li link_to(comment.comment, admin_comment_path(comment))
            end
          end
        end
      end
    end
  end
end
