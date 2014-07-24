class String
  def print_length
    self.each_char.map{|c| c.bytesize == 1 ? 1 : 2}.reduce(0, &:+)
  end
  
  def rpad(length, padding = " ")
    self + (padding * (length - self.print_length))
  end

  def lpad(length, padding = " ")
    (padding * (length - self.print_length)) + self
  end

  def padding(length, type = nil)
    begin # auto decection code.
      raise ArgumentError if type == :string
      Float(self)
      self.lpad(length, "0")
    rescue ArgumentError
      self.rpad(length, " ")
    end
  end
end
