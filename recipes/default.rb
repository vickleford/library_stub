it = finder.join ''

file '/tmp/foo' do
  content "found #{it}"
end