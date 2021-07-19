# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  text       :string           not null
#  poll_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Question < ApplicationRecord
  validates :text, presence: true

  has_many :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: 'AnswerChoice'

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: 'Poll'

  has_many :responses,
    through: :answer_choices,
    source: :responses



  def results_n_plus_1
    results ={}
    self.answer_choices.each do |ac|
      results[ac.text] = ac.responses.length
    end
    results
  end

  def results_2
    results = {}
    self.answer_choices.includes(:responses).each do |ac|
      results[ac.text]=ac.responses.length
    end
    results
  end

  # def results_1_query_sql
  #   acs = AnswerChoice.find_by_sql([<<-SQL, id])
  #     SELECT answer_choices.text, COUNT(responses.id) AS num_responses
  #     FROM answer_choices
  #     LEFT OUTER JOIN responses ON answer_choices.id = responses.answer_choice_id
  #     WHERE answer_choices.question_id = ?
  #     GROUP BY answer_choices.id
  #     SQL

  #     acs.inject({}) do |results, ac|
  #       results[ac.text] = ac.num_responses; results
  #     end
  # end

  def results
    acs = self.answer_choices
      .select("answer_choices.text, COUNT(responses.id) AS num_responses")
      .left_outer_joins(:responses).group("answer_choices.id")

    acs.inject({}) do |results, ac|
      results[ac.text] = ac.num_responses; results
    end
  end
end
