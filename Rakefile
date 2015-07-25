task :install do
  %w{tmux tmux.conf vim vimrc zsh zshrc bin}.each do |name|
    File.symlink("#{ENV['HOME']}/.dotfiles/#{name}", "#{ENV['HOME']}/.#{name}") unless File.exists?("#{ENV['HOME']}/.#{name}")
  end
  File.symlink("#{ENV['HOME']}/.dotfiles/bin", "#{ENV['HOME']}/bin") unless File.exists?("#{ENV['HOME']}/bin")
end
