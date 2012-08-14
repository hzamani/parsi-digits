# encoding: utf-8

module ParsiDigits
  PARSI_DIGITS = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹']
  
  class << self
    def to_parsi digit
      PARSI_DIGITS[digit.to_i] if digit =~ /[0-9]/
    end
    
    def to_western digit
      PARSI_DIGITS.index digit if digit =~ /[۰-۹]/
    end

    def locale_separator options={}
      locale  = options[:locale]
      default = options[:default]
      default ||= (locale == :fa ? '/' : '.')
      begin
        I18n.t(:'number.format.separator', default: default, locale: locale)
      rescue
        default
      end
    end
    def fa_separator
      locale_separator locale: :fa
    end
    def en_separator
      locale_separator locale: :en
    end

    def locale_delimiter options={}
      locale  = options[:locale]
      default = options[:default]
      default ||= (locale == :fa ? '٫' : ',')
      begin
        I18n.t(:'number.format.delimiter', default: default, locale: locale)
      rescue
        default
      end
    end
    def fa_delimiter
      locale_delimiter locale: :fa
    end
    def en_delimiter
      locale_delimiter locale: :en
    end
  end
end

class String
  def with_parsi_digits
    gsub(/\d/) { |d| ParsiDigits.to_parsi d }
  end
  
  def with_parsi_digits!
    gsub!(/\d/) { |d| ParsiDigits.to_parsi d }
  end
  
  def with_western_digits
    gsub(/[۰-۹]/) { |d| ParsiDigits.to_western d }
  end
  
  def with_western_digits!
    gsub!(/[۰-۹]/) { |d| ParsiDigits.to_western d }
  end
  
  def has_parsi_digits?
    self =~ /[۰-۹]/
  end

  def remove_delimiters options={locale: :fa}
    locale = options[:locale]
    delimiter = options[:delimiter]
    delimiter ||= ParsiDigits.locale_delimiter locale: locale
    gsub delimiter, ''
  end

  def remove_delimiters!
    locale = options[:locale]
    delimiter = options[:delimiter]
    delimiter ||= ParsiDigits.locale_delimiter locale: locale
    gsub! delimiter, ''
  end
  
  alias_method :western_to_i, :to_i
  def to_i base=10
    if has_parsi_digits?
      with_western_digits.western_to_i base
    else
      western_to_i base
    end
  end
  
  alias_method :western_to_f, :to_f
  def to_f
    if has_parsi_digits?
      separator = ParsiDigits.fa_separator
      with_western_digits.sub(separator, '.').western_to_f
    else
      western_to_f
    end
  end
end

class Integer
  def with_parsi_digits
    to_s.with_parsi_digits
  end
end

class Float
  def with_parsi_digits
    separator = ParsiDigits.fa_separator
    to_s.with_parsi_digits.sub '.', separator
  end
end
