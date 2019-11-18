module ConsoleMethods

  # find Icon by name--string or symbol--with or without preceding "The"
  def i(name)
    name
      .to_s.titlecase
      .then { |str| str.prepend("The ") unless str.start_with? "The " }
      .then { |str| Icon.find_by(name: str) }
  end

end
