# Borrowed from pellegrino (https://github.com/pellegrino/dotfiles/blob/master/Rakefile)

desc "Install dotfiles"
task :install => [ "install:config_files" ]

namespace "install" do
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
