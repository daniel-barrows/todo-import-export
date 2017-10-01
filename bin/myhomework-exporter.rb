#!/usr/bin/env ruby
# Author::    Daniel Barrows (https://github.com/daniel-barrows)
# Copyright:: 2017 Daniel Barrows
# License::   GPLv3 or later
#
# Limitations:
# - no notes
# - no repeat increments, just true/false repeat value
# - doesn't differentiate between low priority and no priority

require 'hpricot'
require 'csv'

module MyHomework

  IMPORTANCE_MAP = {'rimportant' => '1', 'important' => '2'}

  module_function

  # Currently only accepted filenames
  def html_to_csv(html_filename, csv_filename)

    unrecognized_importance_level = nil

    $h = Hpricot.parse(File.read(html_filename))
    CSV.open(csv_filename, 'w') do |csv|
      csv.puts(%w[ Name Due Class Importance Type Repeats ])
      $h.search('.hw-row').each do |item|
        name       = item.search('.h-name')[0].inner_text
        due        = item.search('.h-date')[0].inner_text.strip
        course     = item.search('.h-class')[0].inner_text
        # "\302\240" = non-breaking space
        course.gsub!("\302\240", '')
        course.strip!
        type = item.search('.h-type')[0].inner_text
        repeats='false'
        meta = item.search('.hw-icon')
        if meta.empty?
          priority = ''
        else
          meta = meta[0]['class'].sub('hw-icon','')
          repeats='true' if meta.sub!('repeat','')
          meta.strip!
          priority = IMPORTANCE_MAP[meta]
          # This is strictly unnecessary, but is more future-proof.
          unrecognized_importance_level = meta if not priority and not meta.empty?
          priority ||= meta
        end
        csv.puts([ name, due, course, priority, type, repeats ])
      end
    end

    if unrecognized_importance_level and not $VERBOSE.nil?
      $stderr.puts "WARNING: Unrecognized importance level: #{unrecognized_importance_level}"
      $stderr.puts "         MyHomework has likely updated thier interface"
      $stderr.puts "         and this script may no longer function properly."
    end

    nil
  end

end


if __FILE__ == $0
  if ARGV.length != 2
    $stderr.puts "USAGE: #{__FILE__} input.html output.csv"
    exit 2
  end

  MyHomework.html_to_csv(*ARGV)
end
