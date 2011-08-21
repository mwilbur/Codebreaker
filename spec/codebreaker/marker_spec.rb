require 'spec_helper'

module Codebreaker

  describe Marker do

    describe '#exact_match_count' do
      context "with no matches" do
        it "returns 0" do
          marker = Marker.new('1234','5555')
          marker.exact_match_count.should == 0
        end
      end
      context "with 1 exact match" do
        it "returns 1" do
          marker = Marker.new('1234','1555')
          marker.exact_match_count.should == 1
        end
      end
      context "with 2 exact matches" do
        it "returns 2" do
          marker = Marker.new('1234','1255')
          marker.exact_match_count.should == 2
        end
      end
      context "with 1 number matches" do
        it "returns 0" do
          marker = Marker.new('1234','5155')
          marker.exact_match_count.should == 0
        end
      end
      context "with 1 exact match and 1 number match" do
        it "returns 1" do
          marker = Marker.new('1234','1355')
          marker.exact_match_count.should == 1
        end
      end


    end
    describe '#number_match_count' do
      context 'with no matches' do
        it "should return 0" do
          marker = Marker.new('1234','5555')
          marker.number_match_count.should == 0
        end
      end
      context "with 1 number match" do
        it "should return 1" do
          marker = Marker.new('1234','5155')
          marker.number_match_count.should == 1
        end
      end
      context "with 1 exact match" do
        it "should return 0" do
          marker = Marker.new('1234','1555')
          marker.number_match_count.should == 0
        end
      end
      context "with 1 exact match and 1 number match" do
        it "should return 1" do
          marker = Marker.new('1234','1525')
          marker.number_match_count.should == 1
        end
      end
    end
  end
end