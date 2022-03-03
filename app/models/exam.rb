class Exam < ApplicationRecord
  belongs_to :user
  belongs_to :schedule

  def code
    @code = user_id.to_s(16).rjust(4, '0') # Adiciona os '0's à esquerda "0000"
    @code += "-"
    @code += schedule_id.to_s(16).rjust(4, '0')
    @code += "-"
    @code += (created_at.to_i).to_s(16).last(5) # Pega apenas os últimos 5 caracteres

    return @code.upcase
  end
end
