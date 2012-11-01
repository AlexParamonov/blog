group 's' do # system
  # @TODO use git hook for ctags regeneration
  guard 'shell' do
    def refresh_tags
      `ctags-exuberant -f tags -e -R lib app spec public config`
      puts 'tags refreshed'
    end

    watch(%r{^(lib|app|spec|public|config)/.*\.rb$}) {|m| refresh_tags }
  end
end
