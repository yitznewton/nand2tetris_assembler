class LabelCommand
  def initialize(line)
    @line = line
  end
  
  def valid?
    !!matches
  end

  def label
    line[1..-2] if matches
  end

  private

  attr_reader :line

  def matches
    line[0] == '(' && line[-1] == ')'
  end
end
