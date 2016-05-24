module Apprepo
  module Command
    class Make
      def run
        fputs 'make run executed'
      end
    end

    def run
      fputs 'legacy run executed'
    end
  end
end
