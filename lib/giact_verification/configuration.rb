require 'yaml'

module GiactVerification
  class Configuration

    attr_accessor :api_username
    attr_accessor :api_password

    def initialize(args = {})
      @giact_endpoint = args[:giact_endpoint] || GiactVerification::ProductionEndpoint.new

      @giact_endpoint.mount
    end

    def giact_endpoint=(endpoint_type)
      @giact_endpoint.dismount
      @giact_endpoint = GiactVerification::EndpointFactory.for(type: endpoint_type)
      @giact_endpoint.mount
    end

    def giact_uri
      @giact_endpoint.uri
    end

    def giact_endpoint
      @giact_endpoint.type
    end

    def invalid?
      api_username.nil? || api_password.nil?
    end

    def servicing?(state)
      serviced_states.include?(state)
    end

    def servicing_country?(country)
      serviced_countries.include?(country)
    end

    def accepts_id_type?(id_type)
      valid_alternative_id_types.include?(id_type)
    end

    def valid_account_type?(account_type)
      valid_account_types.include?(account_type)
    end

    private

    def valid_account_types
      @valid_account_types ||= YAML.load_file(GiactVerification.config_directory + '/valid_account_types.yml')
    end

    def valid_alternative_id_types
      @valid_alternative_id_types ||= YAML.load_file(GiactVerification.config_directory + '/alternative_id_types.yml')
    end

    def serviced_states
      @serviced_states ||= YAML.load_file(GiactVerification.config_directory + '/serviced_states.yml')
    end

    def serviced_countries
      @serviced_countries ||= YAML.load_file(GiactVerification.config_directory + '/serviced_countries.yml')
    end
  end
end
