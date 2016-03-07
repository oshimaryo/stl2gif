require 'minitest_helper'

describe Stl2gif do
  it 'has a version number' do
    Stl2gif::VERSION.wont_be_nil
  end

  describe Stl2gif::Stl do
    subject { Stl2gif::Stl.new(File.expand_path('../fixtures/test.stl',__FILE__)) }

    before do
      subject.render_frame 0
      subject.render_frame 0.35 * Math::PI
      subject.render_frame 0.5 * Math::PI
    end

    it 'generates frames' do
      subject.frames.size.must_equal 3
    end

    it 'converts to gif' do
      gif_file = subject.to_gif 'test'

      File.exists?(gif_file.path).must_equal true
    end

    it 'converts to png' do
      png_file = subject.to_png 'test'

      File.exists?(png_file.path).must_equal true
    end
  end
end
