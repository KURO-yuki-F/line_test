

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network :forwarded_port, guest: 4567, host: 4567
end





































# Vagrant.configure("2") do |config|
#   config.vm.box = "ubuntu/trusty64"
#   config.vm.network :forwarded_port, guest: 4567, host: 4567
#   config.vm.synced_folder ".", "/vagrant"
#
#   GUEST_RUBY_VERSION = '2.4.1'
#
#   GUEST_NVM_VERSION = '0.30.1'
#   GUEST_NODE_VERSION = 'stable'
#
#   # 必要なパッケージをインストール
#   config.vm.provision "shell", privileged: true, inline: <<-__SCRIPT__
#     export DEBIAN_FRONTEND=noninteractive
#     apt-get update -y
#     # database
#     apt-get install -y debconf-utils
#     # debconf-set-selections <<< "mysql-server-5.5 mysql-server/root_password password \"\""
#     # debconf-set-selections <<< "mysql-server-5.5 mysql-server/root_password_again password  \"\""
#     # apt-get install -y mysql-server-5.5 mysql-client-5.5 libmysqlclient-dev
#     # apt-get install -y redis-server
#     # develop env
#     apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
#     # for testing
#     # apt-get install -y phantomjs qt5-default libqt5webkit5-dev
#     cp /usr/share/zoneinfo/Japan /etc/localtime
#   __SCRIPT__
#
#   # RubyとNodeをコンパイル
#   config.vm.provision "shell", privileged: false, inline: <<-__SCRIPT__
#     # install rbenv
#     git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
#     git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
#     git clone git://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
#     echo $'export PATH="\$HOME/.rbenv/bin:\$HOME/.rbenv/plugins/ruby-build/bin:\$PATH"' >> ~/.bashrc
#     echo $'eval "\$(rbenv init -)"' >> ~/.bashrc
#     echo $'. ~/.nvm/nvm.sh' >> ~/.bashrc
#     echo $'gem: --no-ri --no-rdoc' > ~/.gemrc
#     # install nvm
#     curl -s https://raw.githubusercontent.com/creationix/nvm/v#{GUEST_NVM_VERSION}/install.sh | bash
#     export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
#     eval "$(rbenv init -)"
#     . ~/.nvm/nvm.sh
#     #{defined?(GUEST_RUBY_VERSION) ? "rbenv install %s; rbenv global %s; gem install bundler" % [GUEST_RUBY_VERSION, GUEST_RUBY_VERSION] : ''}
#     #{defined?(GUEST_NODE_VERSION) ? "nvm install %s; nvm alias default %s" % [GUEST_NODE_VERSION, GUEST_NODE_VERSION] : ''}
#   __SCRIPT__
#
#   config.vm.provider "virtualbox" do |vb|
#     vb.memory = ENV["VM_MEMORY"] || "1024"
#     vb.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10000]
#   end
# end
#
# =begin
# シンプルなRails開発環境
# - Ruby
# - Node (オプション)
# - MySQL
# - Redis
# - PhantomJS
# - Webkit5 (for Capybara)
# 参照:
# https://gorails.com/setup/ubuntu/14.10
# =end
