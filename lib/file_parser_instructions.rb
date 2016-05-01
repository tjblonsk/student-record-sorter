module FileParserInstructions
  MAPPER = {
    comma: {
      path: './data/comma.txt',
      delimiter: Regexp.new(/,\s/),
      order: [
        :last_name, :first_name, :campus, :favorite_color, :date_of_birth
      ]
    },
    dollar: {
      path: './data/dollar.txt',
      delimiter: Regexp.new(/\s\$\s/),
      order: [
        :last_name, :first_name, :middle_initial, :campus, :date_of_birth, :favorite_color
      ]
    },

    pipe: {
      path: './data/pipe.txt',
      delimiter: Regexp.new(/\s\|\s/),
      order: [
        :last_name, :first_name, :middle_initial, :campus, :favorite_color, :date_of_birth
      ]
    }
  }
end
