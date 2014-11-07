class PagesController < ApplicationController
  def index

    quote1 = Quote.new
    quote1.text = "Big Gulps huh? Welp, see you later."
    quote1.author = "Jim Carey"

    quote2 = Quote.new
    quote2.text = "Winter is coming."
    quote2.author = "Ned Stark"

    quote3 = Quote.new
    quote3.text = "The best part of waking up is Foldgers in your cup."
    quote3.author = "Wilbur Foldgers "

    @quotes = [quote1, quote2, quote3]

  end

  def faq

	  question1 = Question.new
	  question1.question = "How do you do this?"
	  question1.answer = "Follow the directions."

	  question2 = Question.new
	  question2.question = "Does this work?"
	  question2.answer = "As of now, I think it does."

	  question3 = Question.new
	  question3.question = "What is a question?"
	  question3.answer = "A sentence worded or expressed so as to elicit information."

    @questions = [question1, question2, question3]


end
end
