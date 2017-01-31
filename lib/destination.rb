class Destination
  def initialize(assembly)
    @assembly = assembly
  end

  def to_hack
    a + d + m
  end

  private

  attr_reader :assembly

  def a
    assembly.include?('A') ? '1' : '0'
  end

  def d
    assembly.include?('D') ? '1' : '0'
  end

  def m
    assembly.include?('M') ? '1' : '0'
  end
end
