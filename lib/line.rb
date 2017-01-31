require_relative 'label_command'

class Line
  def initialize(line)
    @line = line
  end

  def command
    @command ||= decommented.strip
  end

  def label?
    label_command.valid?
  end

  def label
    label_command.label
  end

  def empty?
    command.empty?
  end

  private

  attr_reader :line

  def decommented
    finish = line.index('//') || -1
    line[0...finish]
  end

  def label_command
    @label_command ||= LabelCommand.new(command)
  end
end
