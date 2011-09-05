require 'pathname'

def install(name, package, location)
   target_path = location + name

   puts "*" * 72
   puts "*** Instaling #{name} to #{target_path} from #{package}"
   puts # blank line

   rm_rf target_path

   case package.match( /^(.*?):/ )[1]
   when 'git'
      sh "git clone #{package} #{target_path} > /dev/null"
      rm_rf target_path + '.git'
   when 'http', 'htps'
      # TODO: check the extension to see if it is a tar file!!!
      mkdir_p target_path
      sh "cd #{target_path} && curl -s '#{package}' | tar zx -"
   else
      puts "Nothing to install!!"
   end

   docdir = target_path + 'doc'
   if docdir.exist?
      puts "doc dir exists; tagging"
      sh "vim -u NONE -esX -c 'helptags #{docdir}' -c quit"
   end
end

task :default do
   puts "Hi! All this Rakefile can do right now is update the bundles:"
   puts # blank line
   puts " $ rake plugins:update"
end

namespace :plugins do

   AUTOLOAD = {
      :pathogen => "https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim"
   }

   BUNDLES = {
      # plugins
      :bufexplorer => "http://www.vim.org/scripts/download_script.php?src_id=12904",
      :css_color => "git://github.com/ap/vim-css-color.git",
      :nerdcommenter => "git://github.com/scrooloose/nerdcommenter.git",
      :nerdtree => "git://github.com/scrooloose/nerdtree.git",
      :rails => "git://github.com/tpope/vim-rails.git",
      :surround => "git://github.com/tpope/vim-surround.git",
      :tabular => "git://github.com/godlygeek/tabular",
      :taglist => "http://www.vim.org/scripts/download_script.php?src_id=7701",

      # syntax definitions
      :syntax_git => "git://github.com/tpope/vim-git.git",
      :syntax_markdown => "git://github.com/ujihisa/vim-markdown.git",
      :syntax_rdoc => "git://github.com/depuracao/vim-rdoc.git",

      # color schemes
      :colors_solarized => "git://github.com/altercation/vim-colors-solarized.git"
   }

   desc "update any plugins defined in the Rakefile"
   task :update do
      autoload_dir = Pathname.new(ENV.fetch("HOME")) + ".vim" + "autoload"
      mkdir_p autoload_dir
      AUTOLOAD.each do |package,location|
         puts "#{package} => #{location}"
         install package.to_s, location, autoload_dir
      end
      exit!

      bundle_home = Pathname.new( ENV['HOME'] ) + '.vim' + 'bundle'
      mkdir_p bundle_home

      BUNDLES.sort_by {|k,v| k.to_s }.each do |bundle, location|
         target_path = bundle_home + bundle.to_s
         install(bundle.to_s, locaton, target_path)
      end
   end

end




