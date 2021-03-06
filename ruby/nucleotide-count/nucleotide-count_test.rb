require 'minitest/autorun'
require 'minitest/pride'
require_relative 'dna'
require 'pry'
#
# There are 5 types of nucleotides. 4 of these occur in DNA: `A`, `C`, `G`, and `T`. 4 occur in RNA: `A`, `C`, `G`, `U`.
class DNATest < MiniTest::Unit::TestCase
  def test_empty_dna_string_has_no_adenosine
    
    assert_equal 0, DNA.new('').count('A')
  end

  def test_empty_dna_string_has_no_nucleotides
    
    expected = {'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0}
    assert_equal expected, DNA.new('').nucleotide_counts
  end

  def test_repetitive_cytidine_gets_counted
    
    assert_equal 5, DNA.new('CCCCC').count('C')
  end

  def test_repetitive_sequence_has_only_guanosine
    
    expected = {'A' => 0, 'T' => 0, 'C' => 0, 'G' => 8}
    assert_equal expected, DNA.new('GGGGGGGG').nucleotide_counts
  end

  def test_counts_only_thymidine
    
    assert_equal 1, DNA.new('GGGGGTAACCCGG').count('T')
  end

  def test_counts_a_nucleotide_only_once
    dna = DNA.new('CGATTGGG')
    dna.count('T')
    assert_equal 2, dna.count('T')
  end

  def test_dna_has_no_uracil
    assert_equal 0, DNA.new('GATTACA').count('U')
  end

  def test_dna_counts_do_not_change_after_counting_uracil
    dna = DNA.new('GATTACA')
    dna.count('U')
    expected = {'A' => 3, 'T' => 2, 'C' => 1, 'G' => 1}
    assert_equal expected, dna.nucleotide_counts
  end

  def test_validates_nucleotides
    assert_raises ArgumentError do
      DNA.new('GACT').count('X')
    end
  end

  def test_validates_dna_not_rna
    assert_raises ArgumentError do
      DNA.new('ACGU')
    end
  end

  def test_validates_dna
    assert_raises ArgumentError do
      DNA.new('John')
    end
  end

  def test_counts_all_nucleotides
    s = 'AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC'
    dna = DNA.new(s)
    expected = {'A' => 20, 'T' => 21, 'G' => 17, 'C' => 12}
    assert_equal expected, dna.nucleotide_counts
  end
end
