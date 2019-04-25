FROM wordpress


RUN docker-php-ext-install -j$(nproc) mysqli pdo_mysql
RUN apt-get install -y sendmail sendmail-bin mailutils && rm -rf /var/lib/apt/lists/*
RUN a2enmod rewrite

CMD /usr/sbin/service sendmail restart && /usr/local/bin/apache2-foreground
