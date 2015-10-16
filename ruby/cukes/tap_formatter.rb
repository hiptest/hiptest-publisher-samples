require 'rubygems'
require 'cucumber/formatter/io'

module Cucumber
  module Formatter
    class HiptestTapFormatter
      include Io

      def initialize(runtime, path_or_io, options)
        @runtime, @io, @options = runtime, ensure_io(path_or_io, "hiptest_tap"), options
        @result = []
        @scenario_number = 1
      end

      def scenario_name(keyword, name, file_colon_line, source_indent)
        @scenario_outline = false
        @scenario_name = name
        @scenario_status = :passed
        @error_description = []
      end

      def after_feature_element(scenario)
        return if @scenario_outline

        if @scenario_status == :passed
          ok(@scenario_name)
        else
          not_ok(@scenario_name, @error_description)
        end
      end

      def before_examples_array(examples_array)
        @scenario_outline = true
      end

      def before_table_row(table_row)
        @scenario_status = :passed
      end

      def after_table_row(table_row)
        return if table_row.cells.last == "hiptest-uid"

        if @scenario_status == :passed
          ok("#{@scenario_name} #{table_row.cells.inspect}")
        else
          not_ok("#{@scenario_name} #{table_row.cells.inspect}", @error_description)
        end
      end

      def table_cell_value(value, status)
        @scenario_status = :failed if status == :failed
      end

      def after_step_result(keyword, step_match, multiline_arg, status, exception, source_indent, background, file_colon_line)
        @scenario_status = :failed if status == :failed
      end

      def exception(exception, status)
        @error_description += exception.to_s.split("\n")
      end

      def after_features(features)
        @io.puts("1..#{@result.size}")
        @io.puts(@result.join("\n"))
      end

      protected

      def ok(title)
        @result << "ok #{@scenario_number} #{title}"
        @scenario_number += 1
      end

      def not_ok(title, description_lines)
        @result << "not ok #{@scenario_number} #{title}"
        description_lines.each do |line|
          @result.last << "\n  # #{line}"
        end
        @scenario_number += 1
      end
    end
  end
end
