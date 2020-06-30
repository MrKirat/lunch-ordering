module Roleble::Model
  def add_roles(roles)
    roles.each { |role| self.add_role role.to_sym }
  end

  def remove_roles(roles = nil)
    roles.each { |role| self.remove_role role.to_sym } and return if roles.present?
    self.roles.map(&:name).each { |role| self.remove_role role.to_sym }
  end

  def reset_roles(roles)
    self.remove_roles
    self.add_roles(roles)
  end
end