ActiveAdmin.register Passage do
  actions :index, :show, :new, :create, :edit, :update
  permit_params :edition, :reference, :passage

  form do |f|
    f.semantic_errors
    f.inputs :edition, :reference, :passage
    f.actions
  end
end
