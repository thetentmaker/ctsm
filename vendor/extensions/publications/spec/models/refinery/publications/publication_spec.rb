require 'spec_helper'

module Refinery
  module Publications
    describe Publication do
      describe "validations" do
        subject do
          FactoryGirl.create(:publication,
          :category => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:category) { should == "Refinery CMS" }
      end
    end
  end
end
