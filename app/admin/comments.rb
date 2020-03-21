ActiveAdmin.register Comment do
  actions :index, :show, :new, :create, :edit, :update
  permit_params :reference_id, :user_id, :comment, :status

  form do |f|
    f.semantic_errors
    f.inputs :reference, :user, :comment, :status
    f.actions
  end
end
