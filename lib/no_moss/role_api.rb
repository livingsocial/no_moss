require 'forwardable'

module NoMoss
  class RoleApi < Module
    def api_methods
      _api_methods.dup
    end

    def methods_missing_from(object)
      _api_methods.reject{|m| object.respond_to?(m) }
    end

    def restrict(object)
      proxy_class.new(object)
    end

    private

    def implements(*args)
      _api_methods.concat args
    end

    def _api_methods
      @api_methods ||= []
    end

    class AbstractProxy
      extend Forwardable

      def initialize(object)
        @object = object
      end

      def method_missing(name, *args, &b)
        super
      rescue NoMethodError
        raise \
          NoMoss::NoRoleApiMethodError, \
          "#{name} method not included in the API of this role."
      end
    end

    def proxy_class
      @proxy_class ||= begin
        klass = Class.new(AbstractProxy)
        klass.def_delegators :@object, *api_methods
        const_set :Proxy, klass
        klass
      end
    end
  end
end
