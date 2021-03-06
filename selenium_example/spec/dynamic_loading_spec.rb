# filename: spec/dynamic_loading_spec.rb
require_relative 'spec_helper'
require_relative '../pages/dynamic_loading'

describe 'Dynamic Loading', :deep do
  before(:each) do
    @dynamic_loading = DynamicLoading.new(@driver) 
  end

  it 'Example 1: Hidden Element' do 
    @dynamic_loading.load '1' 
    expect(@dynamic_loading.finish_text_present?).to be_truthy
  end


  it 'Example 2: Rendered after the fact' do 
    @dynamic_loading.load '2' 
    expect(@dynamic_loading.finish_text_present?).to be_truthy
  end
end