class Exam < ApplicationRecord
  belongs_to :user
  belongs_to :schedule

  def code
    @code = user_id.to_s(16).rjust(4, '0') # Adiciona os '0's à esquerda "0000"
    @code += "-"
    @code += schedule_id.to_s(16).rjust(4, '0')
    @code += "-"
    @code += id.to_s(16).rjust(4, '0')

    return @code.upcase
  end

  def self.decode(code)
    return code.to_i(16)
  end
end
