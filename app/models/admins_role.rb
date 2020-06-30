class AdminsRole < ApplicationRecord
  belongs_to :admin
  belongs_to :role

  # => Roles description
  # root -> admin can edit other admins via ui
  # ui   -> admin has access to ui
  # api  -> admin has access to api
  ROLES = [:root, :ui, :api]
end
