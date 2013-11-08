require "no_moss/version"
require "no_moss/role_api"

module NoMoss
  class NoRoleApiMethodError < NoMethodError ; end

  def self.define_role(&b)
    role = RoleApi.new
    role.module_eval(&b)
    role
  end
end
