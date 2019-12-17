class InvalidCodonError < ArgumentError
  def initialize(msg = 'Invalid RNA')
    super
  end
end

class Translation
  CODONS = { %w(AUG)             => 'Methionine',
     	       %w(UUU UUC)         => 'Phenylalanine',
  	         %w(UUA UUG)         => 'Leucine',
  	         %w(UCU UCC UCA UCG) => 'Serine',
             %w(UAU UAC)         => 'Tyrosine',
             %w(UGU UGC)         => 'Cysteine',
             %w(UGG)             => 'Tryptophan',
             %w(UAA UAG UGA)     => 'STOP'  }


  def self.of_rna(strand)
    blocks = strand.scan(/.{3}/).map! { |block| of_codon(block) }
    stop?(blocks) ? stopped(blocks) : blocks
  end

  def self.of_codon(string)
    raise InvalidCodonError if not_rna?(string)
    CODONS.each { |key, value| return value if key.include?(string) }
  end

  def self.not_rna?(input)
    input.match(/[^CGUA]/)
  end

  def self.stop?(aminos)
    aminos.include?('STOP')
  end

  def self.stopped(aminos)
    aminos.take(aminos.index('STOP'))
  end
end
