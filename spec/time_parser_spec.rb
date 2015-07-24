require 'spec_helper'
require 'boss_mailer/time_parser'

describe BossMailer::TimeParser do
  let(:parser) { BossMailer::TimeParser.new }

  describe '#parse' do
    context 'hours and minutes given' do
      context 'colom given' do
        it 'parses HH:MM to HH:MM' do
          test_parsing '19:00', '19:00'
        end

        it 'parses H:MM to HH:MM' do
          test_parsing '9:00', '09:00'
        end
      end

      context 'no colom given' do
        it 'parses HHMM to HH:MM' do
          test_parsing '1900', '19:00'
        end

        it 'parses H to HH:MM' do
          test_parsing '945', '09:45'
        end
      end
    end

    context 'hours only' do
      it 'parses HH to HH:MM' do
        test_parsing '24', '24:00'
      end

      it 'parses H to HH:MM' do
        test_parsing '9', '09:00'
      end
    end
  end

  def test_parsing(input, expected_output)
    expect(parser.parse input).to eq expected_output
  end
end
