ActiveAdmin.register User do
  actions :index, :show, :new, :create, :edit, :update
  permit_params :email, :name, :role, :password, :password_confirmation

  index do
    id_column
    column :uuid
    column :email
    column :name
    column :role
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :uuid
      row :email
      row :name
      row :role
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|
    f.semantic_errors
    f.inputs :email, :name, :role, :password, :password_confirmation
    f.actions
  end
end
