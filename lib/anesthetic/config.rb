module Anesthetic

  module Config

    DEFAULT_DUMP_DESCRIPTORS = false
    DEFAULT_DUMP_LOCAL_VARIABLES = true
    DEFAULT_DUMP_INSTANCE_VARIABLES = true

    KEYS = [ :dump_descriptors,
             :dump_local_variables,
             :dump_instance_variables ]

    attr_accessor *KEYS

    def self.extended(base)
      base.reset
    end

    def configure
      yield self
      self
    end

    def reset
      self.dump_descriptors        = DEFAULT_DUMP_DESCRIPTORS
      self.dump_local_variables    = DEFAULT_DUMP_LOCAL_VARIABLES
      self.dump_instance_variables = DEFAULT_DUMP_INSTANCE_VARIABLES
    end

  end

end
