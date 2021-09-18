require 'rails_helper'

RSpec.describe Users::Links::CreateContract do
  subject(:contract) { described_class.new }

  context 'when the link is not an expected value' do
    it {
      expect(
        contract.call({}).errors.to_h[:link]
      ).to eq(['is missing'])
    }

    it {
      expect(
        contract.call({ link: nil }).errors.to_h[:link]
      ).to eq(['must be a hash'])
    }

    it {
      expect(
        contract.call({ link: 'string' }).errors.to_h[:link]
      ).to eq(['must be a hash'])
    }

    it {
      expect(
        contract.call({ link: 1 }).errors.to_h[:link]
      ).to eq(['must be a hash'])
    }

    it {
      expect(
        contract.call({ link: 1 }).errors.to_h[:link]
      ).to eq(['must be a hash'])
    }
  end

  context 'when the name of link is not an expected value' do
    it {
      expect(
        contract.call({ link: {} }).errors.to_h.dig(:link, :name)
      ).to eq(['is missing'])
    }

    it {
      expect(
        contract.call({ link: { name: nil } }).errors.to_h.dig(:link, :name)
      ).to eq(['must be filled'])
    }

    it {
      expect(
        contract.call({ link: { name: '' } }).errors.to_h.dig(:link, :name)
      ).to eq(['must be filled'])
    }

    it {
      expect(
        contract.call({ link: { name: 1 } }).errors.to_h.dig(:link, :name)
      ).to eq(['must be a string'])
    }
  end

  context 'when the original_url of link is not an expected value' do
    it {
      expect(
        contract.call({ link: {} }).errors.to_h.dig(:link, :original_url)
      ).to eq(['is missing'])
    }

    it {
      expect(
        contract.call({ link: { original_url: nil } }).errors.to_h.dig(:link, :original_url)
      ).to eq(['must be filled'])
    }

    it {
      expect(
        contract.call({ link: { original_url: '' } }).errors.to_h.dig(:link, :original_url)
      ).to eq(['must be filled'])
    }

    it {
      expect(
        contract.call({ link: { name: 1 } }).errors.to_h.dig(:link, :name)
      ).to eq(['must be a string'])
    }
  end

  context 'when the user is not an expected value' do
    it {
      expect(
        contract.call({}).errors.to_h[:user]
      ).to eq(['is missing'])
    }

    it {
      expect(
        contract.call({ user: nil }).errors.to_h[:user]
      ).to eq(['must be filled'])
    }

    it {
      expect(
        contract.call({ user: 'string' }).errors.to_h[:user]
      ).to eq(['must be User'])
    }

    it {
      expect(
        contract.call({ user: 1 }).errors.to_h[:user]
      ).to eq(['must be User'])
    }

    it {
      expect(
        contract.call({ user: {} }).errors.to_h[:user]
      ).to eq(['must be filled'])
    }
  end
end
