class Word < ActiveRecord::Base
  belongs_to :language
  belongs_to :category
  has_many :componentisations
  
  def self.search(search)
    if search
      where('text LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

  def self.add(phrase, language_id)
    phrase.split(' ').each do |word|
      Word.find_or_create_by_text_and_language_id(word, language_id)
    end
  end
end
