class House

  def self.recite
    new.recite_full
  end

  def recite_full
    recite
  end

  private

  def recite
    result = []
    lyrics = pieces
    lyrics.reverse_each.with_index do |phrase, idx|
      if phrase.size == 1
        result << "This is " + phrase[0] + ".\n"
      else
        current = result[-2].dup
        current.insert(8, "#{phrase[0]}\n#{phrase[1]} ")
        result << current
      end
      result << "\n" unless idx == lyrics.size - 1
    end
    result.join('')
  end

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end
