class Answer < ApplicationRecord
  belongs_to :question,class_name: "Question"
  belongs_to :user
  belongs_to :answer, class_name: "Answer", optional: true
  has_many :replies, class_name: "Answer",
                          foreign_key: "parent_answer_id"
  # accepts_nested_attributes_for :answer
end
