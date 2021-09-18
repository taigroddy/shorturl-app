require 'rails_helper'

RSpec.describe Users::Links::CreateService, type: :service do
  subject(:service) { described_class.call(params) }

  let(:original_url) { Faker::Internet.url }
  let(:params) do
    {
      link: FactoryBot.attributes_for(:link, original_url: original_url),
      user: FactoryBot.create(:user)
    }
  end

  describe 'service failure' do
    let(:original_url) { '' }

    it { expect(service).to be_failure }
  end

  describe 'service success' do
    it { expect(service).to be_success }
    it { expect(service.success.short_path).to be_truthy }
  end
end
