module FileParserInstructions
  MAPPER = {
    comma: {
      delimiter: Regexp.new(/,\s/),
      order: [
        :last_name, :first_name, :campus, :favorite_color, :date_of_birth
      ]
    }
  }
end