module Anesthetic

  class NoLsofBinaryInPath < IOError ; end

  class Descriptors

    def self.pid
      Process.pid
    end

    def self.descriptors
      begin
        `lsof -a -d0-65535 -p #{self.pid}`
      rescue Errno::ENOENT
        raise NoLsofBinaryInPath
      end
    end

  end

end
