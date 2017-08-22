package 'php'
package 'php-fpm'

file '/var/www/html/info.php' do
  content '<html>
  <body>
    <?php phpinfo(); ?>
  </body>
</html>'
end


package 'httpd'

service 'httpd' do
  action [:enable, :start]
end

file '/var/www/html/index.html' do
  content '<html>
  <body>
    <h1>hello world</h1>
  </body>
</html>'
end


