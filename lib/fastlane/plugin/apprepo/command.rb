module Apprepo
  # Responsible for performing commands
  # will replace contents of commands-generator.
  module Command
    # Command class
    class Make
      def run
        fputs 'make run executed'
      end
    end

    # Legacy classless run method
    def run
      fputs 'legacy run executed'
    end
  end
end
