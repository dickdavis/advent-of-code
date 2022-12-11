# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Solutions::Y2022D09 do
  subject(:solution) { described_class.new(input:) }

  let(:input) do
    <<~HEREDOC
      R 4
      U 4
      L 3
      D 1
      R 4
      D 1
      L 5
      R 2
    HEREDOC
  end

  context 'when solving part 1' do
    it 'returns the correct answer' do
      expect(solution.solve_for_first_exercise).to eq(13)
    end
  end

  context 'when solving part 2' do
    it 'returns the correct answer' do
      expect(solution.solve_for_second_exercise).to eq(nil)
    end
  end
end
