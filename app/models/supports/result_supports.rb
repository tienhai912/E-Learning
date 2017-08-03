module Supports
  class ResultSupports
    attr_reader :test, :word_numerical, :words, :result

    def initialize args = {}
      @test = args[:current_user].tests.find_by id: args[:test_id]
      @word_numerical = args[:word_numerical]
      @words = test.lesson.words
    end

    def word
      words[word_numerical]
    end

    def check_answer
      @result ||= Result.find_by test_id: test.id, word_id: words[word_numerical].id
      return 0 unless result
      return 2 if word_numerical + 1 == words.count
      1
    end
  end
end
