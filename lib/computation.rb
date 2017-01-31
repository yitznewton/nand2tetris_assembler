class Computation
  COMPUTATIONS = {
    '0' => '101010',
    '1' => '111111',
    '-1' => '111010',
    'D' => '001100',
    'A' => '110000',
    '!D' => '001101',
    '!A' => '110001',
    '-D' => '001111',
    '-A' => '110011',
    'D+1' => '011111',
    'A+1' => '110111',
    'D-1' => '001110',
    'A-1' => '110010',
    'D+A' => '000010',
    'D-A' => '010011',
    'A-D' => '000111',
    'D&A' => '000000',
    'D|A' => '010101'
  }

  DEFAULT_COMPUTATION = '000000'

  def initialize(assembly)
    @assembly = assembly
  end
  
  def to_hack
    COMPUTATIONS.fetch(assembly_computation, DEFAULT_COMPUTATION)
  end

  private

  attr_reader :assembly

  def assembly_computation
    assembly.gsub('M', 'A')[start..finish]
  end

  def start
    assembly.include?('=') ? assembly.index('=') + 1 : 0
  end

  def finish
    assembly.include?(';') ? assembly.index(';') - 1 : -1
  end
end
