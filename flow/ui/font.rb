module UI
  def self.Font(font)
    case font
      when UI::Font
        self
      when Hash
        name = (font[:name] or raise ":name expected")
        size = (font[:size] or raise ":size expected")
        trait = (font[:trait] or :normal)
        extension = (font[:extension] or :ttf)
        UI::Font.new(name, size, trait, extension)
      when Array
        raise "Expected Array of 2 or 3 or 4 elements" if font.size < 2 or font.size > 4
        UI::Font.new(*font)
      else
        raise "Expected UI::Font or Hash or Array"
    end
  end

  class Font
    attr_reader :proxy

    def italic?
      trait == :italic or trait == :bold_italic
    end

    def bold?
      trait == :bold or trait == :bold_italic
    end
  end
end
