# http://bugs.ruby-lang.org/issues/4347
# works only with >1.9.3

require 'continuation'

module Anesthetic

  def caller_binding
    cont = nil
    count = 0

    set_trace_func lambda { |event, file, lineno, id, binding, klass|
      #printf "%d: %8s %s:%-2d %10s %8s\n", count, event, file, lineno, id, klass
      # First return gets to the caller of this method
      # (which already know its own binding).
      # Second return gets to the caller of the caller.
      # That's we want!
      if count == 2
        set_trace_func nil
        # Will return the binding to the callcc below.
        cont.call binding
      elsif event == "return"
        count += 1
      end
    }
    # First time it'll set the cc and return nil to the caller.
    # So it's important to the caller to return again
    # if it gets nil, then we get the second return.
    # Second time it'll return the binding.
    callcc { |cc| cont = cc }
  end

end
