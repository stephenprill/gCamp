class PagesController < PublicController

  skip_before_action :ensure_current_user

  def index
    quote1 = Quote.new
    quote1.text = "Hey, guys. Whoa, Big Gulps, huh? All right! Welp, see you later."
    quote1.author = "Lloyd Christmas"

    quote2 = Quote.new
    quote2.text = "Winter is Coming."
    quote2.author = "Words of House Stark"

    quote3 = Quote.new
    quote3.text = "Yes, Pete, it is. Actually, it's pronounced 'mill-e-wah-que' which is Algonquin for 'the good land.'"
    quote3.author = "Alice Cooper "

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
