# frozen_string_literal: true

require 'example'
require 'lesson'

RSpec.describe Lesson do
  subject(:lesson) { described_class.new }

  it { expect { lesson.next_example }.not_to raise_error }
end
