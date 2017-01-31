class LabelCommand
  def initialize(line)
    @line = line
  end
  
  def valid?
    line[0] == '(' && line[-1] == ')'
  end

  def label
    line[1..-2] if valid?
  end

  private

  attr_reader :line
end
