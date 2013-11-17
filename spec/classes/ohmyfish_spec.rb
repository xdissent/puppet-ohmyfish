require "spec_helper"

describe "ohmyfish", :type => :class do
  let(:facts) { default_test_facts }
  let(:root) { "/test/boxen/oh-my-fish" }

  it do
    should contain_repository(root).with({
      :ensure => "master",
      :force  => true,
      :source => "bpinto/oh-my-fish",
      :user   => "testuser"
    })

    should contain_file("/test/boxen/env.d/ohmyfish.fish").with_ensure("absent")
    should contain_boxen__env_script("ohmyfish").with_source("puppet:///modules/ohmyfish/ohmyfish.fish")
  end

  context "Linux" do
    let(:facts) { default_test_facts.merge(:osfamily => "Linux") }

    it do
      should_not contain_boxen__env_script("ohmyfish")
    end
  end
end
