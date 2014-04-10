module Midishark
  class Cli
    def initialize(config, args = ARGV)
      @config = config
      @args = args
    end

    def run!
      case @args.first
      when 'capture'
        capture!
      else
        abort "Unknown command: #{@args.first}"
      end
    end

  private

    def capture!
      Midishark::Wireshark.new(@config.tshark_command).exec_process!
    end
  end
end
