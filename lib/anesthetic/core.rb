module Anesthetic

  def anesthetic_dump(bnd, fds)
    puts "#{'*' * 20} Anesthetic dump #{'*' * 20}"
    if not bnd.nil?
      if Anesthetic.dump_local_variables
        locals = eval('local_variables', bnd) unless bnd.nil?
        puts "==--- Local variables:"
        locals.each do |k|
          value = eval k.to_s, bnd
          puts "#{k} - #{value}"
        end
      end
      if Anesthetic.dump_instance_variables
        instances = eval('instance_variables', bnd) unless bnd.nil?
        puts "==--- Instance variables:"
        instances.each do |k|
          value = eval k.to_s, bnd
          puts "#{k} - #{value}"
        end
      end
    end
    if not fds.nil?
      puts "==--- lsof dump:"
      puts fds
    end
    puts "#{'*' * 26} End #{'*' * 26}"
  end

  def raise(*args)
    return unless bnd = caller_binding # http://rubychallenger.blogspot.com/2011/07/caller-binding.html
    fds = nil
    if (args[0] != NoLsofBinaryInPath) && Anesthetic.dump_descriptors
      fds = Descriptors.descriptors
    end
    anesthetic_dump(bnd, fds)
    super(*args)
  end
end

class ::Object
  include Anesthetic
end
