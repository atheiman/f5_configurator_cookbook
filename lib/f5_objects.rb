module F5Config
  class F5Object
    attr_accessor :name, :properties

    def initialize name, properties
      # properties is a hash of all properties to be set for the object. There
      # should also be a partition property if the object is not to be created
      # in Common partition.
      @name = name
      @properties = properties
    end

    def endpoint
      @path + @name
    end
  end

  class VirtualServer < F5Object
    @path = 'ltm/virtual/'
  end

  class HTTPProfile < F5Object
    @path = 'ltm/profile/http/'
  end

  class OneConnectProfile < F5Object
    @path = 'ltm/profile/one-connect/'
  end

  class SSLProfile < F5Object
    @path = 'ltm/profile/client-ssl/'
  end

  class Certificate < F5Object
    @path = 'sys/file/ssl-cert/'
  end

  class Key < F5Object
    @path = 'sys/file/ssl-key/'
  end

  class Pool < F5Object
    @path = 'ltm/policy/'
  end

  class HealthMonitor < F5Object
    @path = 'ltm/policy/'
  end

  class Node < F5Object
    @path = 'ltm/policy/'
  end

  class IRule < F5Object
    @path = 'ltm/policy/'
  end

  class DataGroupList < F5Object
    @path = 'ltm/policy/'
  end

  class RouteDomain < F5Object
    @path = 'ltm/policy/'
  end

  class VLAN < F5Object
    @path = 'ltm/policy/'
  end
end
