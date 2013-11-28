class Pry
  class Command::Ls < Pry::ClassCommand
    class Formatter

      def initialize(target)
        @target = target
      end

      def color(type, str)
        Pry::Helpers::Text.send(Pry.config.ls.send(:"#{type}_color"), str)
      end

      # Add a new section to the output.
      # Outputs nothing if the section would be empty.
      def output_section(heading, body)
        return '' if body.compact.empty?
        fancy_heading = Pry::Helpers::Text.bold(color(:heading, heading))
        Pry::Helpers.tablify_or_one_line(fancy_heading, body)
      end

      def format_value(value)
        Pry::ColorPrinter.pp(value, '')
      end

      def write_out
        return unless @switch
        output_self
      end

      def output_self
        raise NotImplementedError
      end

      def grep
        @grep || proc { |x| x }
      end

    end
  end
end