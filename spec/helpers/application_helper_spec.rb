require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#gulp_asset_path(path)' do
    context 'when trying to find the \'asset.png\'' do
      subject { gulp_asset_path('asset.png') }
      it { is_expected.to eq('/assets/asset.png') }
    end

    # context 'when REV_MANIFEST constant is set' do
    #   subject { gulp_asset_path('asset.png') }
    #   before do
    #     rev_manifest_json =
    #       {
    #         'css/unicorn.css': 'css/unicorn-098f6bcd.css',
    #         'js/unicorn.js': 'js/unicorn-273c2cin.js',
    #         'asset.png': 'asset-046o6dqw.png'
    #       }.to_json

    #     helper.REV_MANIFEST = rev_manifest_json
    #   end

    #   it { is_expected.to eq('/assets/asset-046o6dqw.png') }
    # end
  end
end
