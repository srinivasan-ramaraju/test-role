require 'serverspec'
require 'spec_helper'


context ENV['KITCHEN_INSTANCE'] || host_inventory['hostname'] do
  describe 'TEST ROLE' do
    describe file('/tmp/distrib') do
      it { should exist }
      it { is_expected.to exist }
      it { should be_owned_by 'vagrant' }
      it { is_expected.to be_owned_by 'vagrant' }
      it { should be_grouped_into 'vagrant' }
      it { is_expected.to be_grouped_into 'vagrant' }
      it { should be_mode 644 }
      it { is_expected.to be_mode 644 }
    end

    if os[:family] == 'ubuntu'
      describe file('/tmp/conditional') do
        it { should exist }
        it { is_expected.to exist }
        it { should be_owned_by 'vagrant' }
        it { is_expected.to be_owned_by 'vagrant' }
        it { should be_grouped_into 'vagrant' }
        it { is_expected.to be_grouped_into 'vagrant' }
        it { should be_mode 644 }
        it { is_expected.to be_mode 644 }
        its(:content) { should match(property['playbook_var']) }
        its(:content) { is_expected.to match(property['playbook_var']) }
      end
    end
  end
end
