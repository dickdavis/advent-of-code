# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Solutions::Y2022D08 do
  subject(:solution) { described_class.new(input:) }

  let(:input) do
    <<~HEREDOC
      30373
      25512
      65332
      33549
      35390
    HEREDOC
  end

  context 'when solving part 1' do
    it 'returns the correct answer' do
      expect(solution.solve_for_first_exercise).to eq(21)
    end

    context 'when the cell is not on an edge' do
      context 'for first provided example' do
        let(:params) { { height: 5, row: 1, col: 1 } }

        it 'is visible from the left' do
          expect(
            solution.visible_from_left?(height: params[:height], row: params[:row], column: params[:col])
          ).to be_truthy
        end

        it 'is visible from the top' do
          expect(
            solution.visible_from_top?(height: params[:height], row: params[:row], column: params[:col])
          ).to be_truthy
        end

        it 'is not visible from the bottom' do
          expect(
            solution.visible_from_bottom?(height: params[:height], row: params[:row], column: params[:col])
          ).to be_falsey
        end

        it 'is not visible from the right' do
          expect(
            solution.visible_from_right?(height: params[:height], row: params[:row], column: params[:col])
          ).to be_falsey
        end
      end

      context 'for second provided example' do
        let(:params) { { height: 5, row: 1, col: 2 } }

        it 'is not visible from the left' do
          expect(
            solution.visible_from_left?(height: params[:height], row: params[:row], column: params[:col])
          ).to be_falsey
        end

        it 'is visible from the top' do
          expect(
            solution.visible_from_top?(height: params[:height], row: params[:row], column: params[:col])
          ).to be_truthy
        end

        it 'is not visible from the bottom' do
          expect(
            solution.visible_from_bottom?(height: params[:height], row: params[:row], column: params[:col])
          ).to be_falsey
        end

        it 'is visible from the right' do
          expect(
            solution.visible_from_right?(height: params[:height], row: params[:row], column: params[:col])
          ).to be_truthy
        end
      end

      context 'for third provided example' do
        let(:params) { { height: 1, row: 1, col: 3 } }

        it 'is not visible from the left' do
          expect(
            solution.visible_from_left?(height: params[:height], row: params[:row], column: params[:col])
          ).to be_falsey
        end

        it 'is not visible from the top' do
          expect(
            solution.visible_from_top?(height: params[:height], row: params[:row], column: params[:col])
          ).to be_falsey
        end

        it 'is not visible from the bottom' do
          expect(
            solution.visible_from_bottom?(height: params[:height], row: params[:row], column: params[:col])
          ).to be_falsey
        end

        it 'is not visible from the right' do
          expect(
            solution.visible_from_right?(height: params[:height], row: params[:row], column: params[:col])
          ).to be_falsey
        end
      end

      context 'for fourth provided example' do
        let(:params) { { height: 5, row: 2, col: 1 } }

        it 'is not visible from the left' do
          expect(
            solution.visible_from_left?(height: params[:height], row: params[:row], column: params[:col])
          ).to be_falsey
        end

        it 'is not visible from the top' do
          expect(
            solution.visible_from_top?(height: params[:height], row: params[:row], column: params[:col])
          ).to be_falsey
        end

        it 'is not visible from the bottom' do
          expect(
            solution.visible_from_bottom?(height: params[:height], row: params[:row], column: params[:col])
          ).to be_falsey
        end

        it 'is visible from the right' do
          expect(
            solution.visible_from_right?(height: params[:height], row: params[:row], column: params[:col])
          ).to be_truthy
        end
      end

      context 'for fifth provided example' do
        let(:params) { { height: 3, row: 2, col: 2 } }

        it 'is not visible from the left' do
          expect(
            solution.visible_from_left?(height: params[:height], row: params[:row], column: params[:col])
          ).to be_falsey
        end

        it 'is not visible from the top' do
          expect(
            solution.visible_from_top?(height: params[:height], row: params[:row], column: params[:col])
          ).to be_falsey
        end

        it 'is not visible from the bottom' do
          expect(
            solution.visible_from_bottom?(height: params[:height], row: params[:row], column: params[:col])
          ).to be_falsey
        end

        it 'is not visible from the right' do
          expect(
            solution.visible_from_right?(height: params[:height], row: params[:row], column: params[:col])
          ).to be_falsey
        end
      end

      context 'for sixth provided example' do
        let(:params) { { height: 3, row: 2, col: 3 } }

        it 'is not visible from the left' do
          expect(
            solution.visible_from_left?(height: params[:height], row: params[:row], column: params[:col])
          ).to be_falsey
        end

        it 'is not visible from the top' do
          expect(
            solution.visible_from_top?(height: params[:height], row: params[:row], column: params[:col])
          ).to be_falsey
        end

        it 'is not visible from the bottom' do
          expect(
            solution.visible_from_bottom?(height: params[:height], row: params[:row], column: params[:col])
          ).to be_falsey
        end

        it 'is visible from the right' do
          expect(
            solution.visible_from_right?(height: params[:height], row: params[:row], column: params[:col])
          ).to be_truthy
        end
      end

      context 'for seventh provided example' do
        let(:params) { { height: 5, row: 3, col: 2 } }

        it 'is visible from the left' do
          expect(
            solution.visible_from_left?(height: params[:height], row: params[:row], column: params[:col])
          ).to be_truthy
        end

        it 'is not visible from the top' do
          expect(
            solution.visible_from_top?(height: params[:height], row: params[:row], column: params[:col])
          ).to be_falsey
        end

        it 'is visible from the bottom' do
          expect(
            solution.visible_from_bottom?(height: params[:height], row: params[:row], column: params[:col])
          ).to be_truthy
        end

        it 'is not visible from the right' do
          expect(
            solution.visible_from_right?(height: params[:height], row: params[:row], column: params[:col])
          ).to be_falsey
        end
      end
    end

    context 'when the cell is on the top edge' do
      it 'adds the cell to the array of visible trees' do
        visible_trees_on_first_row = solution.visible_trees.select { |cell| cell[:row] == 0 }
        expect(visible_trees_on_first_row.count).to eq(5)
      end
    end

    context 'when the cell is on the bottom edge' do
      it 'adds the cell to the array of visible trees' do
        visible_trees_on_last_row = solution.visible_trees.select { |cell| cell[:row] == solution.grid.length - 1 }
        expect(visible_trees_on_last_row.count).to eq(5)
      end
    end

    context 'when the cell is on the left edge' do
      it 'adds the cell to the array of visible trees' do
        visible_trees_on_first_column = solution.visible_trees.select { |cell| cell[:column] == 0 }
        expect(visible_trees_on_first_column.count).to eq(5)
      end
    end

    context 'when the cell is on the right edge' do
      it 'adds the cell to the array of visible trees' do
        visible_trees_on_first_column = solution.visible_trees.select do |cell|
          cell[:column] == solution.grid.first.length - 1
        end

        expect(visible_trees_on_first_column.count).to eq(5)
      end
    end
  end

  context 'when solving for part 2' do
    it 'returns the correct answer' do
      expect(solution.solve_for_second_exercise).to eq(8)
    end

    context 'when the cell is not on an edge' do
      context 'for the first example' do
        let(:params) { { height: 5, row: 1, column: 2 } }

        it 'returns the correct scenic score' do
          expect(solution.calculate_scenic_score(**params)).to eq(4)
        end

        it 'returns the correct number of visible trees seen to the top' do
          expect(solution.viewing_distance_to_top(**params)).to eq(1)
        end

        it 'returns the correct number of visible trees seen to the bottom' do
          expect(solution.viewing_distance_to_bottom(**params)).to eq(2)
        end

        it 'returns the correct number of visible trees seen to the left' do
          expect(solution.viewing_distance_to_left(**params)).to eq(1)
        end

        it 'returns the correct number of visible trees seen to the right' do
          expect(solution.viewing_distance_to_right(**params)).to eq(2)
        end
      end

      context 'for the second example' do
        let(:params) { { height: 5, row: 3, column: 2 } }

        it 'returns the correct scenic score' do
          expect(solution.calculate_scenic_score(**params)).to eq(8)
        end

        it 'returns the correct number of visible trees seen to the top' do
          expect(solution.viewing_distance_to_top(**params)).to eq(2)
        end

        it 'returns the correct number of visible trees seen to the bottom' do
          expect(solution.viewing_distance_to_bottom(**params)).to eq(1)
        end

        it 'returns the correct number of visible trees seen to the left' do
          expect(solution.viewing_distance_to_left(**params)).to eq(2)
        end

        it 'returns the correct number of visible trees seen to the right' do
          expect(solution.viewing_distance_to_right(**params)).to eq(2)
        end
      end
    end

    context 'when the cell is on the top edge' do
      let(:params) { { height: 5, row: 0, column: 1 } }

      it 'calculates a scenic score of 0' do
        expect(solution.calculate_scenic_score(height: params[:height], row: params[:row], column: params[:column])).to eq(0)
      end
    end

    context 'when the cell is on the bottom edge' do
      let(:params) { { height: 5, row: 4, column: 1 } }

      it 'calculates a scenic score of 0' do
        expect(solution.calculate_scenic_score(height: params[:height], row: params[:row], column: params[:column])).to eq(0)
      end
    end

    context 'when the cell is on the left edge' do
      let(:params) { { height: 5, row: 4, column: 0 } }

      it 'calculates a scenic score of 0' do
        expect(solution.calculate_scenic_score(height: params[:height], row: params[:row], column: params[:column])).to eq(0)
      end
    end

    context 'when the cell is on the right edge' do
      let(:params) { { height: 5, row: 3, column: 4 } }

      it 'calculates a scenic score of 0' do
        expect(solution.calculate_scenic_score(height: params[:height], row: params[:row], column: params[:column])).to eq(0)
      end
    end
  end
end
