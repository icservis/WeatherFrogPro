require 'liquid'
require 'fileutils'

input_file = File.absolute_path(ARGV[0])
@template = Liquid::Template.parse(File.open(input_file, "r").read)
renderedTemplate = @template.render()
extn = File.extname(input_file)
output_file = File.dirname(input_file) + "/" + File.basename(input_file, extn)
File.open(output_file, "w") {|f| f.write(renderedTemplate) }
