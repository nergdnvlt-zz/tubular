require 'rails_helper'

describe CurrentCondition do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :current_temp }
    it { should validate_presence_of :current_flow }
    it { should validate_presence_of :current_clouds }

    it { should belong_to :base_condition }
  end
end
