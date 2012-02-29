# Borrowed from pellegrino (https://github.com/pellegrino/dotfiles/blob/master/Rakefile)

desc "Install dotfiles"
task :install => [ "install:config_files", "install:bin" ]

namespace "install" do
  task :bin do
    puts "Installing bin files"
    `mkdir -p ~/bin`

    command = "ln -s /Applications/TextMate.app/Contents/Resources/mate ~/bin/mate"
    puts command
    `#{command}`
  end

  task :config_files  do
    puts "Installing configuration files"
    home = File.expand_path('~')

    Dir['*'].each do |file|
      next if (file =~ /Rakefile|README/) or File.directory? file
      target = File.join(home, ".#{file}")
      command = "ln -nfs #{File.expand_path file} #{target}"
      puts command
        `ln -nfs #{File.expand_path file} #{target}`
    end
  end
end
