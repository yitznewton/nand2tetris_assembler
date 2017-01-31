class Jump
  JUMPS = {
    'JGT' => '001',
    'JEQ' => '010',
    'JGE' => '011',
    'JLT' => '100',
    'JNE' => '101',
    'JLE' => '110',
    'JMP' => '111'
  }

  NO_JUMP = '000'

  def initialize(assembly)
    @assembly = assembly
  end

  def to_hack
    JUMPS.fetch(assembly, NO_JUMP)
  end

  private

  attr_reader :assembly
end
