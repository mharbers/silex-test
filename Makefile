timezone:
	echo "Europe/Amsterdam" | timedatectl set-timezone Europe/Amsterdam

update-apt:
	apt-get update -y

base: update-apt
	apt-get install -y vim curl apache2 wget git-core git-sh

apache: base
	rm /etc/apache2/sites-available/000-default.conf
	ln -s /var/www/config/apache2-default-site.conf /etc/apache2/sites-available/000-default.conf
	service apache2 restart

php: update-apt apache
	apt-get install -y php5 php5-dev php5-cli libapache2-mod-php5 php5-mcrypt php5-curl php5-xdebug php5-sybase
        #pear install PHP_CodeSniffer
	#wget https://phar.phpunit.de/phpunit.phar
	#chmod +x phpunit.phar
	#mv phpunit.phar /usr/local/bin/phpunit

composer:
	curl -sS https://getcomposer.org/installer | php
	mv composer.phar /usr/local/bin/composer
