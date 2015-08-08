require 'spec_helper'
require 'boss_mailer/config_fetcher'

describe BossMailer::ConfigFetcher do
  let(:config_fetcher) { BossMailer::ConfigFetcher.new }

  let(:mail_settings) do
    {
      mail_settings: {
        from: 'sender@test.com',
        to: 'receiver@test.com',
        subject: 'Test Subject'
      },
      working_hours: {
        start: '00:00',
        end: '00:00',
        pause: '00:00'
      }
    }
  end

  context 'fetched mail settings' do
    before do
      allow_any_instance_of(BossMailer::ConfigFetcher).to(
        receive(:settings) { mail_settings }
      )
    end

    it 'fetchtes the mail' do
      expect(config_fetcher.mail_settings).not_to eq nil
      expect(config_fetcher.mail_settings[:from]).to eq 'sender@test.com'
      expect(config_fetcher.mail_settings[:to]).to eq 'receiver@test.com'
      expect(config_fetcher.mail_settings[:subject]).to eq 'Test Subject'
    end

    it 'removes unnecessary parts of the input hash' do
      expect(config_fetcher.mail_settings[:working_hours]).to eq nil
    end
  end
end
