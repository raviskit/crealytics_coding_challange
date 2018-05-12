require_relative 'lib/modifier'
require_relative 'lib/csv_file_manager'
include CombinerConstants

csv_file_manager = CSVFileManager.new('project_2012-07-27_2012-10-10_performancedata')
modifier = Modifier.new(MODIFICATION_FACTOR, CANCELLATION_FACTOR)
modifier.modify(csv_file_manager)

puts "DONE modifying"
