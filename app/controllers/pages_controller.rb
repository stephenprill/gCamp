class PagesController < ApplicationController
  def index


    quote1 = Quote.new
    quote1.text = "Big Gulps huh? Welp, see you later"
    quote1.author = "Jim Carey"

    quote2 = Quote.new
    quote2.text = "Winter is coming."
    quote2.author = "Ned Stark"

    quote3 = Quote.new
    quote3.text = "Turn down for what?"
    quote3.author = "Lil Jon"

    @quotes = [quote1, quote2, quote3]


  end
end
