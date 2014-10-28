require 'spec_helper'

describe 'library_stub::default' do
  it 'runs the craziest example evar' do
    expect(base_run).to render_file('/tmp/foo').with_content('found 10.10.4.48')
  end
end